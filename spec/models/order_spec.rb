require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid' do
    it 'must be price' do
      order = Order.new(price: '')
      order.valid?
      expect(order.errors.include? :price).to eq false
    end

    it 'must be deadline' do
      order = Order.new(deadline: '')
      order.valid?
      expect(order.errors.include? :deadline).to eq false
    end

    it 'cubic_size not must be blanck' do
      order = Order.new(cubic_size: '')
      order.valid?
      expect(order.errors.include? :cubic_size).to eq true
    end

    it 'weight not must be blanck' do
      order = Order.new(weight: '')
      order.valid?
      expect(order.errors.include? :weight).to eq true
    end

    it 'distance not must be blanck' do
      order = Order.new(distance: '')
      order.valid?
      expect(order.errors.include? :distance).to eq true
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

    it 'weight must be greater than or equal to 0' do
      order = Order.new(weight: '-1')
      order.valid?
      expect(order.errors[:weight]).to include("deve ser maior ou igual a 0")
    end

    it 'cubic_size must be greater than or equal to 0' do
      order = Order.new(cubic_size: '-1')
      order.valid?
      expect(order.errors[:cubic_size]).to include("deve ser maior ou igual a 0")
    end

    it 'distance must be greater than 0' do
      order = Order.new(distance: '-1')
      order.valid?
      expect(order.errors[:distance]).to include("deve ser maior que 0")
    end
  end

  describe '.calc_freigth' do
    it 'calculate freight from cep' do
      order = create :order
    end
  end
end
