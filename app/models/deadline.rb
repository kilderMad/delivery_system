class Deadline < ApplicationRecord
  validates :distance_max, :distance_min, :time_arrive, presence: true

  belongs_to :carrier
end
