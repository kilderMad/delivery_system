require 'faker'

FactoryBot.define do
  factory :carrier do
    fantasy_name { Faker::Commerce.unique.vendor }
    cnpj { Faker::Company.unique.brazilian_company_number }
    domain { Faker::Internet.unique.domain_name }
    email { Faker::Internet.unique.email }
    address { Faker::Address.full_address }
  end
end
