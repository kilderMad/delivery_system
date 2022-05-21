class Carrier < ApplicationRecord
  validates :fantasy_name, :cnpj, :domain, :email, :address, presence: true
  validates :cnpj, length: { is: 14 }, numericality: true
  validates :fantasy_name, :cnpj, :email, :domain, uniqueness: true

  has_many :vehicles
  has_many :prices
  has_many :deadlines
end
