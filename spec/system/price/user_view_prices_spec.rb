require 'rails_helper'

describe 'User visits prices' do
  it 'and must be authenticated' do
    carrier = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    visit carrier_prices_path(1)
    expect(current_path).to eq new_user_session_path
  end
  it 'and sees prices' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.5, carrier: carrier)
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 11, weight_max: 30, value_km: 0.75, carrier: carrier)
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 31, weight_max: 100, value_km: 1.0, carrier: carrier)
    Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 0, weight_max: 10, value_km: 0.9, carrier: carrier)
    Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 11, weight_max: 30, value_km: 1.5, carrier: carrier)
    Price.create!(cbm_min: 0.501, cbm_max: 1.500, weight_min: 31, weight_max: 500, value_km: 2.25, carrier: carrier)    
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'

    expect(current_path).to eq carrier_prices_path(carrier)
    expect(page).to have_content 'R$ 0,50'
    expect(page).to have_content 'R$ 0,50'
    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content '0.0kg a 10.0kg'
    expect(page).to have_content '11.0kg a 30.0kg'

  end

  it 'and when there are no prices registered' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'

    expect(current_path).to eq carrier_prices_path(carrier)
    expect(page).to have_content 'Não há Preços cadastrados'
  end
end