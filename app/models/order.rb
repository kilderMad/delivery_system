class Order < ApplicationRecord
  enum status: { pendente: 1, Aceito: 2, Recusado: 3, Enviado: 4, Finalizado: 5, Cancelado:6}

  validates :status, :zip_code, :cubic_size,  :pickup_address, :receiver_address, :receiver_cpf, :receiver_name, :receiver_phone, presence: true
  validates :receiver_cpf, length: { is: 11 }, numericality: true
  validates :cubic_size, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :vehicle, optional: true
  belongs_to :carrier
  has_many :order_updates
  before_create :generator_code, :calc_freigth

  def generator_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end

  def calc_freigth
    return unless zip_code || cubic_size

    price = Price.where(carrier: carrier_id).where('cbm_min <= ? AND cbm_max >= ? AND state = ?', cubic_size, cubic_size, gets_uf['uf'])

    self.price = price.last.value
    self.deadline = price.last.deadline
  end

  def gets_uf
    response = Faraday.get("https://viacep.com.br/ws/#{zip_code}/json/")
    JSON.parse(response.body)
  end
end
