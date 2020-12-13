class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        actor = Actor.find_by(first_name: self.first_name, last_name: self.last_name)
        "#{actor.first_name} #{actor.last_name}"
    end

    def list_roles
        character = Character.find_by(actor_id: self.id)
        "#{character.name} - #{Show.find(character.show_id).name}"
    end
end