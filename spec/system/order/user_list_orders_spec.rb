require 'rails_helper'

describe 'user visits orders' do
  it '(admin) and sees all orders' do
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    carrier1 = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br',
                               address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    carrier2 = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br',
                               address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier1)
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier2)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier1)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier2)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier1)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.08, carrier: carrier2)
    order1 = Order.new(distance: 2000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla',
                       receiver_address: 'blableblu', receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699',
                       receiver_phone: '81981316988', carrier: carrier1)
    order2 = Order.new(distance: 1000, weight: 45.0, cubic_size: 0.5, pickup_address: 'plablabla',
                       receiver_address: 'plableblu', receiver_name: 'Simba kilder ferreira', receiver_cpf: '12215516699',
                       receiver_phone: '90991316988', carrier: carrier2)
    order1.save
    order2.save

    login_as(user)
    visit root_path
    click_on 'Pedidos'

    expect(current_path).to eq orders_path
    expect(page).to have_content 'Pedido: ABCBV1234512345'
    expect(page).to have_content 'Status: Pendente de aceite'
    expect(page).to have_content 'Transportadora: DLL'
    expect(page).to have_content 'Dimensão em M cúbicos: 0.4'
    expect(page).to have_content 'Peso: 1.0kg'
    expect(page).to have_content 'Prazo: 8 dias'
    expect(page).to have_content 'Frete: 100'
    expect(page).to have_content 'Endereço de retirada: blablabla'
    expect(page).to have_content 'Informações do destinatario'
    expect(page).to have_content 'Madson kilder filho'
    expect(page).to have_content 'CPF: 71315516699'
    expect(page).to have_content 'Telephone: 81981316988'

    expect(page).to have_content 'Pedido: ABCBV1234512345'
    expect(page).to have_content 'Status: Pendente de aceite'
    expect(page).to have_content 'Transportadora: DLL'
    expect(page).to have_content 'Dimensão em M cúbicos: 0.5'
    expect(page).to have_content 'Peso: 1.0kg'
    expect(page).to have_content 'Frete: 80'
    expect(page).to have_content 'Prazo: 4 dias'
    expect(page).to have_content 'Endereço de retirada: plablabla'
    expect(page).to have_content 'Informações do destinatario'
    expect(page).to have_content 'Simba kilder ferreira'
    expect(page).to have_content 'CPF: 12215516699'
    expect(page).to have_content 'Telephone: 90991316988'
  end

  it '(user) and sees all orders' do
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    carrier1 = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br',
                               address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    carrier2 = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br',
                               address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier1)
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier2)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier1)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier2)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier1)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, state: 'PE', value: 0.08, carrier: carrier2)
    Order.create!(distance: 1000, weight: 1.0, cubic_size: 0.4, pickup_address: 'blablabla',
                  receiver_address: 'blableblu', receiver_name: 'Madson kilder filho', receiver_cpf: '71315516699',
                  receiver_phone: '81981316988', deadline: 6, carrier: carrier1)
    Order.create!(distance: 2000, status: 2, weight: 41.3, cubic_size: 0.5, pickup_address: 'plablabla',
                  receiver_address: 'plableblu', receiver_name: 'Simba kilder ferreira', receiver_cpf: '12215516699',
                  receiver_phone: '90991316988', deadline: 5, carrier: carrier2)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)
    visit root_path
    click_on 'Pedidos'

    expect(current_path).to eq orders_path
    expect(page).to have_content 'Pedido: ABCBV1234512345'
    expect(page).to have_content 'Status: Aceito'
    expect(page).to have_content 'Transportadora: DLL'
    expect(page).to have_content 'Dimensão em M cúbicos: 0.5'
    expect(page).to have_content 'Peso: 41.3kg'
    expect(page).to have_content 'Prazo: 8 dias'
    expect(page).to have_content 'Frete: 160'
    expect(page).to have_content 'Endereço de retirada: plablabla'
    expect(page).to have_content 'Informações do destinatario'
    expect(page).to have_content 'Simba kilder ferreira'
    expect(page).to have_content 'CPF: 12215516699'
    expect(page).to have_content 'Telephone: 90991316988'

    expect(page).not_to have_content 'Status: Pendente de aceite'
    expect(page).not_to have_content 'Transportadora: Pac'
    expect(page).not_to have_content 'Dimensão em M cúbicos: 0.4'
    expect(page).not_to have_content 'Frete: 50'
    expect(page).not_to have_content 'Peso: 1.0kg'
    expect(page).not_to have_content 'Endereço de retirada: blablabla'
    expect(page).not_to have_content 'Madson kilder filho'
    expect(page).not_to have_content 'CPF: 71315516699'
    expect(page).not_to have_content 'Telephone: 81981316988'
  end

  it 'and when there are no orders registered' do
    Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br',
                    address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path
    click_on 'Pedidos'

    expect(page).to have_content 'Não há pedidos'
  end
end
