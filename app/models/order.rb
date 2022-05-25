class Order < ApplicationRecord
  enum status: { "Pendente de aceite": 1, Aceito: 2, Negado: 3, Enviado: 4, Finalizado: 5}

  validates :status, :code, :cubic_size, :pickup_address, :receiver_address, :receiver_cpf, :receiver_name, :receiver_phone, :weight, :distance, presence: true
  validates :code, length: { is: 15 }
  validates :receiver_cpf, length: { is: 11 }, numericality: true
  validates :cubic_size, :weight, numericality: { greater_than_or_equal_to: 0 }
  validates :distance, numericality: { greater_than: 0 }

  belongs_to :carrier
  before_validation :generator_code, :calc_deadline

  private

  def generator_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end

  def calc_deadline
    if self.carrier
      deadline = Deadline.where(carrier: self.carrier_id).where("distance_min <= ? AND distance_max >= ?", self.distance, self.distance)
      if !deadline.last.nil?
        self.deadline = deadline[0].time_arrive
      end
    end

    if self.deadline
      price = Price.where(carrier: self.carrier_id).where("cbm_min <= ? AND cbm_max >= ? AND weight_min <= ? AND weight_max >= ?", self.cubic_size, self.cubic_size, self.weight, self.weight)
      self.price = price.last.value_km * self.distance
    end
  end
end
