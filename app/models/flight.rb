class Flight < ApplicationRecord
  searchkick
  
  belongs_to :airline
  has_many :tickets
  has_many :passengers, through: :tickets

  before_create :update_price

  def remaining_seats
    (self.number_of_seats)-(self.tickets.count)
  end

  def update_price
    if self.departure.wday == 5 or self.departure.wday == 6
      if self.departure.strftime("%P") == "AM"
        self.price += 150
      else
        self.price += 100
      end
    else
      if self.departure.strftime("%P") == "AM"
        self.price += 50
      else
        self.price
      end
    end
  end

end

