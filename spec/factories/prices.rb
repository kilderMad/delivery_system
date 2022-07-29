require 'faker'

FactoryBot.define do
  factory :price do
    cbm_min { 0.01 }
    cbm_max { 10 }
    value { 100 }
    state { 'PE' }
    deadline { 4 }
    carrier
  end
end
