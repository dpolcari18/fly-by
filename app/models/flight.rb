class Flight < ApplicationRecord
  belongs_to :airline
  has_many :tickets
  has_many :passengers, through: :tickets

  def remaining_seats
    (self.number_of_seats)-(self.tickets.count)
  end
end
