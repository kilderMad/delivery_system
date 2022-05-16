require 'rails_helper'

RSpec.describe Carrier, type: :model do
  describe '#valid?' do
    it 'fantasy_name not be blank' do
      carrier = Carrier.new(fantasy_name: '', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      expect(carrier.valid?).to eq false
    end

    it 'cnpj not be blank' do
      carrier = Carrier.new(fantasy_name: 'Pac', cnpj: '', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      expect(carrier.valid?).to eq false
    end

    it 'domain not be blank' do
      carrier = Carrier.new(fantasy_name: 'Pac', cnpj: '12345678901234', domain: '', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      expect(carrier.valid?).to eq false
    end
    
    it 'address not be blank' do
      carrier = Carrier.new(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: '', email: 'support@pac.com.br')
      expect(carrier.valid?).to eq false
    end

    it 'email not be blank' do
      carrier = Carrier.new(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: '')
      expect(carrier.valid?).to eq false
    end

    it 'cnpj must be 14 digits' do
      carrier = Carrier.new(fantasy_name: 'Pac', cnpj: '1234567890123', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      expect(carrier.valid?).to eq false
    end

    it 'cnpj must be numeric' do
      carrier = Carrier.new(fantasy_name: 'Pac', cnpj: '1234567890123h', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      expect(carrier.valid?).to eq false
    end

    it 'cnpj already exists' do
      carrier1 = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      carrier2 = Carrier.new(fantasy_name: 'Pacae', cnpj: '12345678901234', domain: 'pacae.com.br', address: 'Av. Jalino do Libano, 145', email: 'support@pacae.com.br')
      expect(carrier2.valid?).to eq false
    end

    it 'fantasy_name already exists' do
      carrier1 = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      carrier2 = Carrier.new(fantasy_name: 'Pac', cnpj: '12345678901235', domain: 'pacae.com.br', address: 'Av. Jalino do Libano, 145', email: 'support@pacae.com.br')
      expect(carrier2.valid?).to eq false
    end

    it 'email already exists' do
      carrier1 = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      carrier2 = Carrier.new(fantasy_name: 'Pacae', cnpj: '12345678901235', domain: 'pacae.com.br', address: 'Av. Jalino do Libano, 145', email: 'support@pac.com.br')
      expect(carrier2.valid?).to eq false
    end

    it 'domain already exists' do
      carrier1 = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      carrier2 = Carrier.new(fantasy_name: 'Pacae', cnpj: '12345678901235', domain: 'pac.com.br', address: 'Av. Jalino do Libano, 145', email: 'support@pacae.com.br')
      expect(carrier2.valid?).to eq false
    end
  end
end
