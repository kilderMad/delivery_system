require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid' do
    it 'must be price' do
      carrier = create :carrier
      create :price, carrier: carrier
      order = create :order, carrier: carrier

      expect(order.price).not_to be_nil
    end

    it 'must be deadline' do
      carrier = create :carrier
      create :price, carrier: carrier
      order = create :order, carrier: carrier

      expect(order.deadline).not_to be_nil
    end

    it 'cubic_size not must be blanck' do
      order = Order.new(cubic_size: '')
      order.valid?
      expect(order.errors.include? :cubic_size).to eq true
    end

    it 'pickup_address not must be blanck' do
      order = Order.new(pickup_address: '')
      order.valid?
      expect(order.errors.include? :pickup_address).to eq true
    end

    it 'pickup_address not must be blanck' do
      order = Order.new(pickup_address: '')
      order.valid?
      expect(order.errors.include? :pickup_address).to eq true
    end

    it 'receiver_address not must be blanck' do
      order = Order.new(receiver_address: '')
      order.valid?
      expect(order.errors.include? :receiver_address).to eq true
    end

    it 'receiver_name not must be blanck' do
      order = Order.new(receiver_name: '')
      order.valid?
      expect(order.errors.include? :receiver_name).to eq true
    end

    it 'receiver_cpf not must be blanck' do
      order = Order.new(receiver_cpf: '')
      order.valid?
      expect(order.errors.include? :receiver_cpf).to eq true
    end

    it 'receiver_phone not must be blanck' do
      order = Order.new(receiver_phone: '')
      order.valid?
      expect(order.errors.include? :receiver_phone).to eq true
    end

    it 'receiver_cpf must be 11 digits' do
      order = Order.new(receiver_cpf: '1234567890')
      order.valid?
      expect(order.errors[:receiver_cpf]).to include("não possui o tamanho esperado (11 caracteres)")
    end

    it 'receiver_cpf must be numeric' do
      order = Order.new(receiver_cpf: '1234567890q')
      order.valid?
      expect(order.errors[:receiver_cpf]).to include("não é um número")
    end

    it 'cubic_size must be greater than or equal to 0' do
      order = Order.new(cubic_size: '-1')
      order.valid?
      expect(order.errors[:cubic_size]).to include("deve ser maior ou igual a 0")
    end
  end
end
