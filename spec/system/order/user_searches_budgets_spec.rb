require 'rails_helper'

describe 'User does budgets' do
  it 'and sees budgets' do
    carrier1 = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br',
                               address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    carrier2 = Carrier.create!(fantasy_name: 'Pac', cnpj: '52345678901243', domain: 'pac.com.br',
                               address: 'Av. Figueiras, 45', email: 'support@pac.com.br')
    carrier3 = Carrier.create!(fantasy_name: 'Correios', cnpj: '22345678901243', domain: 'correios.com.br',
                               address: 'Av. gen san martins, 65', email: 'support@correios.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 1.500, deadline: 14, state: 'PE', value: 200, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 14, state: 'PE', value: 270, carrier: carrier1)
    Price.create!(cbm_min: 3.501, cbm_max: 6.500, deadline: 14, state: 'PE', value: 290, carrier: carrier1)
    Price.create!(cbm_min: 0.001, cbm_max: 1.500, deadline: 11, state: 'PE', value: 250, carrier: carrier2)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 11, state: 'PE', value: 300, carrier: carrier2)
    Price.create!(cbm_min: 3.501, cbm_max: 6.500, deadline: 11, state: 'PE', value: 320, carrier: carrier2)
    Price.create!(cbm_min: 0.001, cbm_max: 1.500, deadline: 5, state: 'SE', value: 300, carrier: carrier3)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 5, state: 'SE', value: 320, carrier: carrier3)
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    login_as(user)

    visit orders_path
    fill_in 'cubic_size', with: '2'
    fill_in 'cep', with: '50720-570'
    click_on 'Buscar'

    expect(page).to have_content 'DLL - frete R$ 270,00 | 14 dias úteis'
    expect(page).to have_content 'Pac - frete R$ 300,00 | 11 dias úteis'
    expect(page).not_to have_content 'Correios'
    expect(page).to have_content '2 resultados encontrados'
  end

  it 'and there are no results' do
    carrier1 = Carrier.create!(status: 2, fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    carrier2 = Carrier.create!(status: 2, fantasy_name: 'Pac', cnpj: '52345678901243', domain: 'pac.com.br', address: 'Av. Figueiras, 45', email: 'support@pac.com.br')
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 14, state: 'SE', value: 300, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 11, state: 'SE', value: 300, carrier: carrier2)
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    login_as(user)

    visit orders_path
    fill_in 'cubic_size', with: '2'
    fill_in 'cep', with: '50720-570'
    click_on 'Buscar'

    expect(page).to have_content 'Resultados da busca para: 50720-570 | 2M cúbicos'
    expect(page).not_to have_content 'DLL - frete R$ 270,00 | 14 dias úteis'
    expect(page).not_to have_content 'Pac - frete R$ 300,00 | 11 dias úteis'
    expect(page).to have_content '0 resultados encontrados'
  end

  it 'and user submits blank form' do
    carrier1 = Carrier.create!(status: 2, fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br',
                               address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    carrier2 = Carrier.create!(status: 2, fantasy_name: 'Pac', cnpj: '52345678901243', domain: 'pac.com.br',
                               address: 'Av. Figueiras, 45', email: 'support@pac.com.br')
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 14, state: 'SE', value: 300, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 11, state: 'SE', value: 300, carrier: carrier2)
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    login_as(user)

    visit orders_path
    click_on 'Buscar'

    expect(page).not_to have_content 'DLL - frete R$ 270,00 | 14 dias úteis'
    expect(page).not_to have_content 'Pac - frete R$ 300,00 | 11 dias úteis'
    expect(page).to have_content '0 resultados encontrados'
  end
end
