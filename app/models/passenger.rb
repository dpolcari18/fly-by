class Passenger < ApplicationRecord
    has_many :tickets
    has_many :flights, through: :tickets

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
