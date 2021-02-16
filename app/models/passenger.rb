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

    def favorite_destination
        destinations = self.tickets.map {|ticket| ticket.flight.destination }
        destinations.max_by { |city| destinations.count(city) }
    end

    def total_flight_hours
        total = self.closed_status.map {|ticket| ticket.flight.arrival - ticket.flight.departure }.sum
        (total/3600).to_i
    end

    private

    def capitalize
        self.first_name.capitalize!
        self.last_name.capitalize!
    end
end
