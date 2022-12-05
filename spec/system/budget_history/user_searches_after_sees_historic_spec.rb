require 'rails_helper'

describe 'User visits budget history' do
  it 'and sees history' do
    carrier1 = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br',
                               address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    carrier2 = Carrier.create!(fantasy_name: 'Pac', cnpj: '52345678901243', domain: 'pac.com.br',
                               address: 'Av. Figueiras, 45', email: 'support@pac.com.br')
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 14, state: 'PE', value: 270, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 11, state: 'PE', value: 300, carrier: carrier2)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 14, state: 'AC', value: 180, carrier: carrier1)
    Price.create!(cbm_min: 1.501, cbm_max: 3.500, deadline: 11, state: 'AC', value: 200, carrier: carrier2)
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    login_as(user)

    visit orders_path
    fill_in 'cubic_size', with: '2'
    fill_in 'cep', with: '50720-570'
    click_on 'Buscar'
    click_on 'Voltar'

    fill_in 'cubic_size', with: '2'
    fill_in 'cep', with: '69900-900'
    click_on 'Buscar'
    click_on 'Voltar'
    click_on 'Historico'

    expect(current_path).to eq budget_histories_path
    expect(page).to have_content 'DLL - frete R$ 270,00 | CEP: 50720-570 | 14 dias úteis | 2.0M cúbicos'
    expect(page).to have_content 'Pac - frete R$ 300,00 | CEP: 50720-570 | 11 dias úteis | 2.0M cúbicos'
    expect(page).to have_content 'DLL - frete R$ 180,00 | CEP: 69900-900 | 14 dias úteis | 2.0M cúbicos'
    expect(page).to have_content 'Pac - frete R$ 200,00 | CEP: 69900-900 | 11 dias úteis | 2.0M cúbicos'
  end
end
