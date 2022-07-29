require 'rails_helper'

describe 'user can see order_updates' do
  it 'from the order' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.08, carrier: carrier)
    vehicle = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    order = Order.create!(status: 2, vehicle: vehicle , zip_code: '50720-570', cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
    receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
    OrderUpdate.create!(order: order, date: '2022/12/05', hour: '6:30', last_location: 'Centro Tratamento DLL SP', next_location: 'Centro Tratamento DLL PE')
    OrderUpdate.create!(order: order, date: '2022/12/11', hour: '10:30', last_location: 'Centro Tratamento DLL PE', next_location: 'Centro de distribuição Recife')
    OrderUpdate.create!(order: order, date: '2022/12/13', hour: '15:30', last_location: 'Centro de distribuição Recife', next_location: 'entrega ao destinatario')
    login_as(user)

    visit orders_path
    click_on 'Ver detalhes de entrega'

    expect(page).to have_content '05/12/2022 - 6:30'
    expect(page).to have_content 'De Centro Tratamento DLL SP para Centro Tratamento DLL PE'
    expect(page).to have_content '11/12/2022 - 10:30'
    expect(page).to have_content 'De Centro Tratamento DLL PE para Centro de distribuição Recife'
    expect(page).to have_content '13/12/2022 - 15:30'
    expect(page).to have_content 'De Centro de distribuição Recife para entrega ao destinatario'
  end
end
