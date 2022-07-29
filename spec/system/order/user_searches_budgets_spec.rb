require 'rails_helper'

describe 'User does budgets' do
  it 'and sees budgets' do
    carrier1 = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    carrier2 = Carrier.create!(fantasy_name: 'Pac', cnpj: '52345678901243', domain: 'pac.com.br', address: 'Av. Figueiras, 45', email: 'support@pac.com.br')
    carrier3 = Carrier.create!(fantasy_name: 'Correios', cnpj: '22345678901243', domain: 'correios.com.br', address: 'Av. gen san martins, 65', email: 'support@correios.com.br')
    Deadline.create!(distance_min: 0, distance_max: 1200, time_arrive: 5, carrier: carrier1)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 10, carrier: carrier1)
    Deadline.create!(distance_min: 2001, distance_max: 4000, time_arrive: 14, carrier: carrier1)
    Deadline.create!(distance_min: 0, distance_max: 1200, time_arrive: 3, carrier: carrier2)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 7, carrier: carrier2)
    Deadline.create!(distance_min: 2001, distance_max: 4000, time_arrive: 11, carrier: carrier2)
    Deadline.create!(distance_min: 0, distance_max: 1200, time_arrive: 4, carrier: carrier3)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier3)
    Price.create!(cbm_min: 0.001, cbm_max: 1.500, state: 'PE', value: 0.05, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.09, carrier: carrier1)
    Price.create!(cbm_min: 3.501, cbm_max: 6.500, state: 'PE', value: 0.12, carrier: carrier1)
    Price.create!(cbm_min: 0.001, cbm_max: 1.500, state: 'PE', value: 0.04, carrier: carrier2)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.10, carrier: carrier2)
    Price.create!(cbm_min: 3.501, cbm_max: 6.500, state: 'PE', value: 0.13, carrier: carrier2)
    Price.create!(cbm_min: 0.001, cbm_max: 1.500, state: 'PE', value: 0.04, carrier: carrier3)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.08, carrier: carrier3)
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    login_as(user)

    visit orders_path
    fill_in 'cubic_size', with: '2'
    fill_in 'Estado', with: 'PE'
    fill_in 'distance', with: '3000'
    click_on 'Buscar'

    expect(page).to have_content 'DLL - frete R$ 270,00 | 14 dias úteis'
    expect(page).to have_content 'Pac - frete R$ 300,00 | 11 dias úteis'
    expect(page).not_to have_content 'Correios'
    expect(page).to have_content '2 resultados encontrados'
  end

  it 'and there are no results' do
    carrier1 = Carrier.create!(status: 2, fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    carrier2 = Carrier.create!(status: 2, fantasy_name: 'Pac', cnpj: '52345678901243', domain: 'pac.com.br', address: 'Av. Figueiras, 45', email: 'support@pac.com.br')
    Deadline.create!(distance_min: 2001, distance_max: 4000, time_arrive: 14, carrier: carrier1)
    Deadline.create!(distance_min: 2001, distance_max: 4000, time_arrive: 11, carrier: carrier2)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.09, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.10, carrier: carrier2)
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    login_as(user)

    visit orders_path
    fill_in 'cubic_size', with: '2'
    fill_in 'weight', with: '45'
    fill_in 'distance', with: '3000'
    click_on "Buscar"

    expect(page).to have_content 'Resultados da busca para: 45kg | 2M cúbicos | 3000km'
    expect(page).not_to have_content 'DLL - frete R$ 270,00 | 14 dias úteis'
    expect(page).not_to have_content 'Pac - frete R$ 300,00 | 11 dias úteis'
    expect(page).to have_content '0 resultados encontrados'
  end

  it 'and user submits blank form' do
    carrier1 = Carrier.create!(status: 2, fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br',
                               address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    carrier2 = Carrier.create!(status: 2, fantasy_name: 'Pac', cnpj: '52345678901243', domain: 'pac.com.br',
                               address: 'Av. Figueiras, 45', email: 'support@pac.com.br')
    Deadline.create!(distance_min: 2001, distance_max: 4000, time_arrive: 14, carrier: carrier1)
    Deadline.create!(distance_min: 2001, distance_max: 4000, time_arrive: 11, carrier: carrier2)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.09, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, state: 'PE', value: 0.10, carrier: carrier2)
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    login_as(user)

    visit orders_path
    click_on "Buscar"

    expect(page).not_to have_content 'DLL - frete R$ 270,00 | 14 dias úteis'
    expect(page).not_to have_content 'Pac - frete R$ 300,00 | 11 dias úteis'
    expect(page).to have_content '0 resultados encontrados'
  end
end
