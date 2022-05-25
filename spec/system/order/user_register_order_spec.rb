require 'rails_helper'

describe 'user register new order' do
  it 'must be authorized' do
    visit new_order_path
    expect(current_path).to eq new_user_session_path
  end
  it 'success' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, weight_min: 1, weight_max: 30, value_km: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, weight_min: 1, weight_max: 50, value_km: 0.08, carrier: carrier) 
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    login_as(user)
    visit root_path
    click_on 'Pedidos'
    click_on 'Cadastrar novo'
    
    fill_in 'Peso', with: '10'
    fill_in 'Metros cúbicos', with: '1'
    fill_in 'Destinatário', with: 'Kilder costa filho'
    fill_in 'CPF', with: '71319927790'
    fill_in 'Telephone', with: '81981316988'
    fill_in 'Endereço de entrega', with: 'Rua cambui, 1, zumbi, Recife/PE'
    fill_in 'Endereço de retirada', with: 'Av. São paulo, 123'
    fill_in 'Distancia', with: '1500'
    select 'DLL', from: 'Transportadora'
    click_on 'Enviar'

    expect(current_path).to eq orders_path
    expect(page).to have_content 'Pedido: ABCBV1234512345'
    expect(page).to have_content 'Status: Pendente de aceite'
    expect(page).to have_content 'Transportadora: DLL'
    expect(page).to have_content 'Dimensão em M cúbicos: 1.0'
    expect(page).to have_content 'Peso: 10.0kg'
    expect(page).to have_content 'Distancia: 1500'
    expect(page).to have_content 'Prazo: 8 dias'
    expect(page).to have_content 'Frete: 75'
    expect(page).to have_content 'Endereço de retirada: Av. São paulo, 123'
    expect(page).to have_content 'Endereço de entrega: Rua cambui, 1, zumbi, Recife/PE'
    expect(page).to have_content 'Informações do destinatario'
    expect(page).to have_content 'Kilder costa filho'
    expect(page).to have_content 'CPF: 71319927790'
    expect(page).to have_content 'Telephone: 81981316988'
  end

  it 'with blank fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Price.create!(cbm_min: 0.301, cbm_max: 1.500, weight_min: 1, weight_max: 30, value_km: 0.05, carrier: carrier)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, weight_min: 1, weight_max: 50, value_km: 0.08, carrier: carrier) 
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    login_as(user)
    visit root_path
    click_on 'Pedidos'
    click_on 'Cadastrar novo'
    
    fill_in 'Peso', with: ''
    fill_in 'Metros cúbicos', with: ''
    fill_in 'Destinatário', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Telephone', with: ''
    fill_in 'Endereço de entrega', with: ''
    fill_in 'Endereço de retirada', with: ''
    fill_in 'Distancia', with: ''
    select '', from: 'Transportadora'
    click_on 'Enviar'

    expect(page).to have_content 'Peso não pode ficar em branco'
    expect(page).to have_content 'Metros cúbicos não pode ficar em branco'
    expect(page).to have_content 'Destinatário não pode ficar em branco'
    expect(page).to have_content 'CPF não pode ficar em branco'
    expect(page).to have_content 'Telephone não pode ficar em branco'
    expect(page).to have_content 'Endereço de entrega não pode ficar em branco'
    expect(page).to have_content 'Endereço de retirada não pode ficar em branco'
    expect(page).to have_content 'Distancia não pode ficar em branco'
  end
end