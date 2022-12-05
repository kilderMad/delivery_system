require 'rails_helper'

RSpec.describe Price, type: :model do
  describe '#valid' do
    it 'Peso cubado min not be blank' do
      price = Price.new(cbm_min: '')
      price.valid?
      expect(price.errors.include? :cbm_min).to eq true
    end

    it 'Peso cubado max not be blank' do
      price = Price.new(cbm_max: '')
      price.valid?
      expect(price.errors.include? :cbm_max).to eq true
    end

    it 'State not be blank' do
      price = Price.new(state: '')
      price.valid?
      expect(price.errors.include? :state).to eq true
    end

    it 'Valor not be blank' do
      price = Price.new(value: '')
      price.valid?
      expect(price.errors.include? :value).to be true
    end
  end
end
