require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#valid?' do
    it 'brand not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      vehicle = Vehicle.new(plate: 'PCL-2932', brand: '', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)

      expect(vehicle.valid?).to eq false
    end

    it 'plate not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      vehicle = Vehicle.new(plate: '', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)

      expect(vehicle.valid?).to eq false
    end

    it 'model not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      vehicle = Vehicle.new(plate: 'PCL-2932', brand: 'Pegeot', model: '', year: '2022', capacity: 3000, carrier: carrier)

      expect(vehicle.valid?).to eq false
    end

    it 'year not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      vehicle = Vehicle.new(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '', capacity: 3000, carrier: carrier)

      expect(vehicle.valid?).to eq false
    end

    it 'capacity not be blank' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      vehicle = Vehicle.new(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: '', carrier: carrier)

      expect(vehicle.valid?).to eq false
    end

    it 'plate already exists' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      vehicle1 = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
      vehicle2 = Vehicle.new(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)

      expect(vehicle2.valid?).to eq false
    end
  end
end
