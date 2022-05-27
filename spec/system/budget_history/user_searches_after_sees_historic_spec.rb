require 'rails_helper'

describe 'User visits budget history' do
  it 'and sees history' do
    carrier1 = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    carrier2 = Carrier.create!(fantasy_name: 'Pac', cnpj: '52345678901243', domain: 'pac.com.br', address: 'Av. Figueiras, 45', email: 'support@pac.com.br')
    Deadline.create!(distance_min: 2001, distance_max: 4000, time_arrive: 14, carrier: carrier1)
    Deadline.create!(distance_min: 2001, distance_max: 4000, time_arrive: 11, carrier: carrier2)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, weight_min: 1, weight_max: 100, value_km: 0.09, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, weight_min: 1, weight_max: 100, value_km: 0.10, carrier: carrier2)
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    login_as(user)

    visit orders_path
    fill_in 'cubic_size', with: '2'
    fill_in 'weight', with: '45'
    fill_in 'distance', with: '3000'
    click_on "Fazer orçamento" 
    click_on 'Voltar'

    fill_in 'cubic_size', with: '2'
    fill_in 'weight', with: '45'
    fill_in 'distance', with: '2001'
    click_on "Fazer orçamento" 
    click_on 'Voltar'
    click_on 'Historico de orçamentos'

    expect(current_path).to eq budget_histories_path
    expect(page).to have_content 'DLL - frete R$ 270.0 | 14'
    expect(page).to have_content 'Pac - frete R$ 300.0 | 11'
    expect(page).to have_content 'DLL - frete R$ 180.09 | 14'
    expect(page).to have_content 'Pac - frete R$ 200.1 | 11'
  end
end