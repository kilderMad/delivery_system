require 'rails_helper'

describe 'User visits prices' do
  it 'and must be authenticated' do
    Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    visit carrier_prices_path(1)
    expect(current_path).to eq new_user_session_path
  end
  it 'and sees prices' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, value: 0.5, state: 'PE', carrier: carrier)
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, value: 0.75, state: 'PE', carrier: carrier)
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, value: 1.0, state: 'PE', carrier: carrier)
    Price.create!(cbm_min: 0.501, cbm_max: 1.500, value: 0.9, state: 'SE', carrier: carrier)
    Price.create!(cbm_min: 0.501, cbm_max: 1.500, value: 1.5, state: 'SE', carrier: carrier)
    Price.create!(cbm_min: 0.501, cbm_max: 1.500, value: 2.25, state: 'SE', carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')

    login_as(user)
    visit root_path
    find('#menu-desktop').click_on 'Dashboard'
    find('#menu-desktop').click_on 'Tabela de preços'

    expect(current_path).to eq carrier_prices_path(carrier)
    expect(page).to have_content 'R$ 0,50'
    expect(page).to have_content 'R$ 0,50'
    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content 'PE'
    expect(page).to have_content 'SE'
  end

  it 'and when there are no prices registered' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    find('#menu-desktop').click_on 'Dashboard'
    find('#menu-desktop').click_on 'Tabela de preços'

    expect(current_path).to eq carrier_prices_path(carrier)
    expect(page).to have_content 'Não há Preços cadastrados'
  end
end
