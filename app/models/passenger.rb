class Passenger < ApplicationRecord
    has_many :tickets
    has_many :flights, through: :tickets

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: {in: 6..20}
    validates :age, presence: true, inclusion: {in: 1..110}

    before_save :capitalize

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    
    def closed_status
        self.tickets.select {|ticket| ticket.status == "Closed"}
    end
    
    def upcoming_status
        self.tickets.select {|ticket| ticket.status != "Closed"}
    end

    private

    def capitalize
        self.first_name.capitalize!
        self.last_name.capitalize!
    end
end
