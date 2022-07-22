require 'rails_helper'

describe 'Order Api' do
  context '/api/v1/orders/search/:code' do
    it 'search success' do
      carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      vehicle = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
      allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
      order = Order.create!(status: 2, vehicle: vehicle ,distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
      receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
      OrderUpdate.create!(order: order, date: '2022/12/05', hour: '6:30', last_location: 'Centro Tratamento DLL SP', next_location: 'Centro Tratamento DLL PE')
      OrderUpdate.create!(order: order, date: '2022/12/11', hour: '10:30', last_location: 'Centro Tratamento DLL PE', next_location: 'Centro de distribuição Recife')
      OrderUpdate.create!(order: order, date: '2022/12/13', hour: '15:30', last_location: 'Centro de distribuição Recife', next_location: 'entrega ao destinatario')

      get '/api/v1/orders/search/ABCBV1234512345'

      data = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(data['code']).to eq 'ABCBV1234512345'
      expect(data['receiver_name']).to eq 'Madson kilder filho'
      expect(data['updates'].length).to eq 3
      expect(data['vehicle']['plate']).to eq 'PCL-2932'
    end

    it 'not found' do
      get '/api/v1/orders/search/ABCBV1234512345'

      data = JSON.parse(response.body)
      expect(response.status).to eq 404
      expect(data['message']).to eq 'not found'
    end
  end
end
