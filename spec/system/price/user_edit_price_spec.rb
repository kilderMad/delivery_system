require 'rails_helper'

describe 'User edit price' do
  it 'and must be authenticated' do
    carrier = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PE', value: 0.5, carrier: carrier)
    visit edit_carrier_price_path(1, 1)
    expect(current_path).to eq new_user_session_path
  end
  it 'and sees filled fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PE', value: 10.5, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    find('#menu-desktop').click_on 'Dashboard'
    find('#menu-desktop').click_on 'Tabela de preços'
    click_on 'Editar'

    expect(page).to have_field('Peso cubado min', with: '0.001')
    expect(page).to have_field('Peso cubado max', with: '0.5')
    expect(page).to have_field('Estado', with: 'PE')
    expect(page).to have_field('Valor', with: '10.5')
  end

  it 'success' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PE', value: 0.5, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    find('#menu-desktop').click_on 'Dashboard'
    find('#menu-desktop').click_on 'Tabela de preços'
    click_on 'Editar'

    fill_in 'Peso cubado min', with: '1.001'
    fill_in 'Peso cubado max', with: '12.6'
    fill_in 'Estado', with: 'PE'
    fill_in 'Valor', with: '10.6'
    click_on 'Enviar'

    expect(page).to have_content '1.001 a 12.6'
    expect(page).to have_content 'R$ 10,60'
    expect(page).to have_content 'PE'
  end

  it 'with blank fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PE', value: 0.5, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    find('#menu-desktop').click_on 'Dashboard'
    find('#menu-desktop').click_on 'Tabela de preços'
    click_on 'Editar'

    fill_in 'Peso cubado min', with: ''
    fill_in 'Peso cubado max', with: ''
    fill_in 'Estado', with: ''
    fill_in 'Valor', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Peso cubado min não pode ficar em branco'
    expect(page).to have_content 'Peso cubado max não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'Valor não pode ficar em branco'
  end
end
