class Order < ApplicationRecord
  enum status: { "Pendente de aceite": 1, Aceito: 2, Recusado: 3, Enviado: 4, Finalizado: 5, Cancelado:6}

  validates :status, :cubic_size, :pickup_address, :receiver_address, :receiver_cpf, :receiver_name, :receiver_phone, :weight, :distance, presence: true
  validates :receiver_cpf, length: { is: 11 }, numericality: true
  validates :cubic_size, :weight, numericality: { greater_than_or_equal_to: 0 }
  validates :distance, numericality: { greater_than: 0 }

  belongs_to :vehicle, optional: true
  belongs_to :carrier
  has_many :order_updates
  before_validation :calc_deadline
  before_create :generator_code

  private

  def generator_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end

  def calc_deadline
    if self.carrier
      deadline = Deadline.where(carrier: carrier_id).where('distance_min <= ? AND distance_max >= ?', distance, distance)
      if !deadline.last.nil?
        self.deadline = deadline[0].time_arrive
      end
    end

    if self.deadline
      price = Price.where(carrier: carrier_id).where('cbm_min <= ? AND cbm_max >= ?', cubic_size, cubic_size)
      self.price = price.last.value * distance
    end
  end
end
