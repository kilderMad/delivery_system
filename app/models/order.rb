class Order < ApplicationRecord
  enum status: { "Pendente de aceite": 1, Aceito: 2, Negado: 3, Enviado: 4, Finalizado: 5}

  validates :status, :code, :cubic_size, :pickup_address, :receiver_address, :receiver_cpf, :receiver_name, :receiver_phone, :weight, presence: true

  belongs_to :carrier
  before_validation :generator_code

  private

  def generator_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end

  def calc_deadline
    self.carrier.id

    Deadline.find_by()
  end
end
