require 'rails_helper'

describe 'User register new price' do
  it 'and must be authenticated' do
    Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    visit new_carrier_price_path(1)
    expect(current_path).to eq new_user_session_path
  end
  it 'success 1/1' do
    Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    click_on 'Cadastrar novo'

    fill_in 'Peso cubado min', with: '0.001'
    fill_in 'Peso cubado max', with: '0.5'
    fill_in 'Estado', with: 'PE'
    fill_in 'Valor', with: '0.5'
    click_on 'Enviar'

    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content 'R$ 0,50'
    expect(page).to have_content 'PE'
  end

  it 'success 2/2' do
    Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    click_on 'Cadastrar novo'

    fill_in 'Peso cubado min', with: '0.001'
    fill_in 'Peso cubado max', with: '0.5'
    fill_in 'Estado', with: 'PE'
    fill_in 'Valor', with: '10.5'
    click_on 'Enviar'
    click_on 'Cadastrar novo'

    fill_in 'Peso cubado min', with: '0.001'
    fill_in 'Peso cubado max', with: '0.5'
    fill_in 'Estado', with: 'SE'
    fill_in 'Valor', with: '14.5'
    click_on 'Enviar'

    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content 'R$ 14,50'
    expect(page).to have_content 'R$ 10,50'
    expect(page).to have_content 'PE'
    expect(page).to have_content 'SE'
  end

  it 'with blank fields' do
    Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    click_on 'Cadastrar novo'
    click_on 'Enviar'

    expect(page).to have_content 'Peso cubado min não pode ficar em branco'
    expect(page).to have_content 'Peso cubado max não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'Valor não pode ficar em branco'
  end
end
