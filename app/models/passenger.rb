class Passenger < ApplicationRecord
    has_many :tickets
    has_many :flights, through: :tickets

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: { in: 6..20}
    validates :age, presence: true, inclusion: { in: 1..110}


    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def child_passengers
        Passenger.all.each do |p|
            p.age < 12
        end
        
    end
end
