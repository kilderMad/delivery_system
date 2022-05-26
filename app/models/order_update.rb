class OrderUpdate < ApplicationRecord

  validates :date, :hour, :last_location, :next_location, presence: true

  belongs_to :order

  after_create :update_status

  def update_status
    updates = OrderUpdate.where(order_id: self.order.id)
    if updates.count == 1
      order = Order.find(self.order.id)
      order.status = 4
      order.save
    end    
  end
end