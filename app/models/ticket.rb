

class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  before_create :create_ticket_number

  private

  def create_ticket_number
    self.ticket_number = rand(1..9999)
  end
end
