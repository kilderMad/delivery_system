class Vehicle < ApplicationRecord
  validates :brand, :model, :plate, :year, :capacity, presence: true
  validates :plate, uniqueness: true
  belongs_to :carrier
end
