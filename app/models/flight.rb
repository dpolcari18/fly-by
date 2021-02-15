class Flight < ApplicationRecord
  belongs_to :airline
  has_many :tickets
  has_many :passengers, through: :tickets

  def remaining_seats
    (self.number_of_seats)-(self.tickets.count)
  end

  def child_price_cal
    if self.passengers.child_passengers 
        self.price = (self.price * 0.75)
      
    elsif self.passengers.age < 2
        self.price = 0
    
    else
        self.price  
    end
    
  end

          
  def price
    original_price = 150
      if self.departure.wday == 5 || 6
          if self.departure.strftime("%P") == "AM"
            self.price = original_price + 150
          else 
            self.price = original_price + 100
          end
      else
          if self.departure.strftime("%P") == "AM"
            self.price = original_price + 50
          else 
            self.price = original_price 
          end
      end
end


end

