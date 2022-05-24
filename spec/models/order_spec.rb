require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid' do
    it 'must be code' do  
      order = Order.new
      order.valid?
      expect(order.errors.include? :code).to eq false
    end
  end
end
