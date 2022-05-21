class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :carrier, optional: true

  before_validation :validate_domain

  private

  def validate_domain
    dominio = self.email.split('@')
    carrier = Carrier.find_by(domain: dominio[1])
    if carrier
      self.carrier = carrier
    else  
      self.admin = true
    end    
  end
end
