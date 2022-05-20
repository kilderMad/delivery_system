class Price < ApplicationRecord
  
  validates :cbm_max, :cbm_min, :weight_min, :weight_max, :value_km, presence: true

  belongs_to :carrier
end
