class OrderUpdate < ApplicationRecord

  validates :date, :hour, :last_location, :next_location, presence: true

  belongs_to :order
end
