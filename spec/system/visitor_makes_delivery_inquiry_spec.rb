require 'rails_helper'

describe 'visitor makes delivery inquiry' do
  it 'and sees your order' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, weight_min: 1, weight_max: 30, value_km: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, weight_min: 1, weight_max: 50, value_km: 0.08, carrier: carrier)
    vehicle = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    order = Order.create!(status: 4, vehicle: vehicle ,distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
      receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)
    OrderUpdate.create!(order: order, date: '2022/12/05', hour: '6:30', last_location: 'Centro Tratamento DLL SP', next_location: 'Centro Tratamento DLL PE')
    OrderUpdate.create!(order: order, date: '2022/12/11', hour: '10:30', last_location: 'Centro Tratamento DLL PE', next_location: 'Centro de distribuição Recife')
    OrderUpdate.create!(order: order, date: '2022/12/13', hour: '15:30', last_location: 'Centro de distribuição Recife', next_location: 'entrega ao destinatario')

    visit root_path
    fill_in 'query', with: 'ABCBV1234512345'
    click_on 'Buscar Pedido'

    expect(page).to have_content 'Pedido ABCBV1234512345'
    expect(page).to have_content 'Status: Enviado'
    expect(page).to have_content '05/12/2022 - 6:30'
    expect(page).to have_content 'De Centro Tratamento DLL SP para Centro Tratamento DLL PE'
    expect(page).to have_content '11/12/2022 - 10:30'
    expect(page).to have_content 'De Centro Tratamento DLL PE para Centro de distribuição Recife'
    expect(page).to have_content '13/12/2022 - 15:30'
    expect(page).to have_content 'De Centro de distribuição Recife para entrega ao destinatario'
    expect(page).to have_content 'Pegeot Partner PCL-2932'

  end

  it 'and there is no order' do
    visit root_path
    fill_in 'query', with: 'ABCBV1234512345'
    click_on 'Buscar Pedido'

    expect(page).to have_content 'Código não encontrado'
  end

  it 'but the order has not been sent' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, weight_min: 1, weight_max: 30, value_km: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, weight_min: 1, weight_max: 50, value_km: 0.08, carrier: carrier)
    vehicle = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    order = Order.create!(status: 2, vehicle: vehicle ,distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla', receiver_address: 'blableblu',
      receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699', receiver_phone: '81981316988', carrier: carrier)

    visit root_path
    fill_in 'query', with: 'ABCBV1234512345'
    click_on 'Buscar Pedido'

    expect(page).to have_content 'Pedido ABCBV1234512345'
    expect(page).to have_content 'Status: Aceito'
    expect(page).to have_content 'Pedido ainda não foi enviado'
    expect(page).to have_content 'Pegeot Partner PCL-2932'
  end

end
