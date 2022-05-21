require 'rails_helper'

describe 'user deletes' do
  it 'success' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Price.create!(cbm_min: 0.001, cbm_max: 0.500, weight_min: 0, weight_max: 10, value_km: 0.5, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    click_on 'Excluir'

    expect(page).to have_content 'Preço apagado com sucesso!'
    expect(page).not_to have_content '0.001 a 0.5'
    expect(page).not_to have_content '0.0kg a 10.0kg'
    expect(page).not_to have_content 'R$ 0.5'
  end
end