class Carrier < ApplicationRecord
  validates :fantasy_name, :cnpj, :domain, :email, :address, presence: true
  validates :cnpj, length: { is: 14 }
  validates :fantasy_name, :cnpj, uniqueness: true
end
