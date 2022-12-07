require 'rails_helper'

describe 'user deletes' do
  it 'success' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, state: 'PE', value: 0.5, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    find('#menu-desktop').click_on 'Dashboard'
    find('#menu-desktop').click_on 'Tabela de preços'
    click_on 'Excluir'

    expect(page).to have_content 'Preço apagado com sucesso!'
    expect(page).not_to have_content '0.001 a 0.5'
    expect(page).not_to have_content 'R$ 0,50'
    expect(page).not_to have_content 'PE'
  end
end
