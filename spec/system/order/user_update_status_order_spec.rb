require 'rails_helper'

describe 'user can' do
  it 'accept order successfully' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.08, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    #allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    order = Order.create!(distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
    receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
    login_as(user)

    visit root_path
    click_on 'Pedidos'
    click_on 'Aceitar'

    expect(page).to have_content 'Status: Aceito'
  end

  it 'reject order successfully' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br',
                              address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.08, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    Order.create!(distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla',
                  receiver_address: 'blableblu', receiver_name: 'Madson kilder filho',
                  receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
    login_as(user)

    visit root_path
    click_on 'Pedidos'
    click_on 'Recusar'

    expect(page).not_to have_content 'Pedido: ABCBV1234512345'
  end

  it 'designate vehicle for order' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.08, carrier: carrier)
    Vehicle.create!(plate: 'PRR-4532', brand: 'Renault', model: 'Maxi', year: '2023', capacity: 3100, carrier: carrier)
    Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    #allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    order = Order.create!(distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
    receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
    login_as(user)

    visit root_path
    click_on 'Pedidos'
    click_on 'Aceitar'
    select 'PCL-2932', from: 'vehicle_id'
    click_on 'Designar Veiculo'

    expect(page).not_to have_content 'Designar Veiculo'
    expect(page).to have_content 'Veiculo: Partner | PCL-2932'
  end

  it 'fisnish order successfully' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.08, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    order = Order.create!(distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
    receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
    login_as(user)

    visit root_path
    click_on 'Pedidos'
    click_on 'Finalizar'

    expect(page).to have_content 'Status: Finalizado'
  end
end
