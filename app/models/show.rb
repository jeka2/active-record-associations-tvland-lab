class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters

    def network       
        Network.find(self.network_id) if self.network_id
    end

    def build_network(call_letters:)
        n = Network.find_or_create_by(call_letters: call_letters)
        self.network_id = n.id
        self.save
        n
    end

    def actors_list
        self.actors.map { |a| "#{a.first_name} #{a.last_name}" }
    end
end