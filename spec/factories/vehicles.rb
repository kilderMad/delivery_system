require 'faker'

FactoryBot.define do
  factory :vehicle do
    plate { Faker::Vehicle.license_plate }
    brand { Faker::Vehicle.manufacture }
    model { Faker::Vehicle.model }
    year { Faker::Vehicle.year }
    capacity { 4000 }
    carrier
  end
end
