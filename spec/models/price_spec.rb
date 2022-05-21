require 'rails_helper'

RSpec.describe Price, type: :model do
  describe '#valid' do
    it 'Metros cúbicos min not be blank' do
      price = Price.new(cbm_min: '')
      price.valid? 
      expect(price.errors.include? :cbm_min).to eq true
    end

    it 'Metros cúbicos max not be blank' do
      price = Price.new(cbm_max: '')
      price.valid? 
      expect(price.errors.include? :cbm_max).to eq true
    end

    it 'Peso min not be blank' do
      price = Price.new(weight_min: '')
      price.valid?
      expect(price.errors.include? :weight_min).to eq true
    end

    it 'Peso max not be blank' do
      price = Price.new(weight_max: '')
      price.valid?
      expect(price.errors.include? :weight_max).to eq true
    end

    it 'Valor por km not be blank' do
      price = Price.new(value_km: '')
      price.valid?
      expect(price.errors.include? :value_km).to be true
    end

  end
end
