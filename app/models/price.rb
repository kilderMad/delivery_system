class Price < ApplicationRecord
  validates :cbm_max, :cbm_min, :state, :value, presence: true

  belongs_to :carrier
end
