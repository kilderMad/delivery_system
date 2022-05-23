require 'rails_helper'

describe 'User edit price' do
  it 'and must be authenticated' do
    carrier = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.5, carrier: carrier)
    visit edit_carrier_price_path(1, 1)
    expect(current_path).to eq new_user_session_path
  end
  it 'and sees filled fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.5, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    click_on 'Editar'

    expect(page).to have_field('Metros cúbicos min', with: '0.001')
    expect(page).to have_field('Metros cúbicos max', with: '0.5')
    expect(page).to have_field('Peso min', with: '0.0')
    expect(page).to have_field('Peso max', with: '10.0')
    expect(page).to have_field('Valor por km', with: '0.5')
  end

  it 'success' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.5, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    click_on 'Editar'

    fill_in 'Metros cúbicos min', with: '0.001'
    fill_in 'Metros cúbicos max', with: '0.6'
    fill_in 'Peso min', with: '0.0'
    fill_in 'Peso max', with: '15.0'
    fill_in 'Valor por km', with: '0.6'
    click_on 'Enviar'

    expect(page).to have_content '0.001 a 0.6'
    expect(page).to have_content '0.0kg a 15.0kg'
    expect(page).to have_content 'R$ 0.6'
  end

  it 'with blank fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.5, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    click_on 'Editar'

    fill_in 'Metros cúbicos min', with: ''
    fill_in 'Metros cúbicos max', with: ''
    fill_in 'Peso min', with: ''
    fill_in 'Peso max', with: ''
    fill_in 'Valor por km', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Metros cúbicos min não pode ficar em branco'
    expect(page).to have_content 'Metros cúbicos max não pode ficar em branco'
    expect(page).to have_content 'Peso min não pode ficar em branco'
    expect(page).to have_content 'Peso max não pode ficar em branco'
    expect(page).to have_content 'Valor por km não pode ficar em branco'
  end
end