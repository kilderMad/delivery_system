require 'rails_helper'

describe 'user add update order' do
  it 'success' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.08, carrier: carrier)
    vehicle = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    order = Order.create!(status: 2, vehicle: vehicle ,distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
    receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
    login_as(user)

    visit orders_path
    click_on 'Atualizar'

    fill_in 'Data', with: '20/10/2022'
    fill_in 'Hora', with: '10:40'
    fill_in 'Chegou em', with: 'Centro de distribuição DLL Mangape'
    fill_in 'Saiu para', with: 'Centro de distribuição DLL Mangape'
    click_on 'Enviar'

    expect(current_path).to eq orders_path
    expect(page).to have_content 'Pedido atualizado com sucesso'
    expect(page).to have_content 'Status: Enviado'
  end

  it 'failed' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.08, carrier: carrier)
    vehicle = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    order = Order.create!(status: 2, vehicle: vehicle ,distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
    receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
    login_as(user)

    visit orders_path
    click_on 'Atualizar'

    fill_in 'Data', with: ''
    fill_in 'Hora', with: ''
    fill_in 'Chegou em', with: ''
    fill_in 'Saiu para', with: ''
    click_on 'Enviar'

    expect(page).not_to have_content 'Pedido atualizado com sucesso'
    expect(page).to have_content 'Data não pode ficar em branco'
    expect(page).to have_content 'Hora não pode ficar em branco'
    expect(page).to have_content 'Chegou em não pode ficar em branco'
    expect(page).to have_content 'Saiu para não pode ficar em branco'

  end
end
