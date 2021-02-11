class Flight < ApplicationRecord
  belongs_to :airline
  has_many :tickets
  has_many :passengers, through: :tickets
end
