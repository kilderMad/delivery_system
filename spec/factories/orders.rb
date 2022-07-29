require 'faker'

FactoryBot.define do
  factory :order do
    cubic_size { 1 }
    pickup_address { Faker::Address.street_address }
    receiver_address { Faker::Address.secondary_address }
    receiver_name { Faker::Name.name }
    receiver_cpf { '510.309.910-14' }
    receiver_phone { '81981316988' }
    zip_code { '50720-570' }
    carrier
    vehicle
  end
end
