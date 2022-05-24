class Order < ApplicationRecord
  enum status: { "Pendente de aceite": 1, Aceito: 2, Negado: 3, Enviado: 4, Finalizado: 5}
  belongs_to :carrier
end
