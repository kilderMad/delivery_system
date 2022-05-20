require 'rails_helper'

RSpec.describe Price, type: :model do
  describe '#valid' do
    it 'Metros cúbicos min not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      price = Price.new(cbm_min: '', cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.5, carrier: carrier)
      
      expect(price.valid?).to eq false
    end

    it 'Metros cúbicos max not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      price = Price.new(cbm_min: 0.001, cbm_max: '', weight_min: 0, weight_max: 10, value_km: 0.5, carrier: carrier)

      expect(price.valid?).to eq false
    end

    it 'Peso min not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      price = Price.new(cbm_min: 0.001, cbm_max: 0.500, weight_min: '', weight_max: 10, value_km: 0.5, carrier: carrier)

      expect(price.valid?).to eq false
    end

    it 'Peso max not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      price = Price.new(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: '', value_km: 0.5, carrier: carrier)

      expect(price.valid?).to eq false
    end

    it 'Valor por km not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      price = Price.new(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: '', carrier: carrier)

      expect(price.valid?).to eq false
    end

  end
end
