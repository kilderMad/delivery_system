require 'rails_helper'

describe 'user' do
  it 'disable carrier successfully' do
      Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      user = User.create!(email: 'kilder@gmail.com', password: 'password', admin: true)
      login_as(user)
      visit root_path 
      click_on 'Transportadoras'
      click_on 'Inativar'

      expect(current_path).to eq carriers_path
      expect(page).to have_content 'desativada'
  end

  it 'reactivate carrier successfully' do
    Carrier.create!(status: 2, fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@gmail.com', password: 'password', admin: true)
    login_as(user)
    visit root_path 
    click_on 'Transportadoras'
    click_on 'Ativar'

    expect(current_path).to eq carriers_path
    expect(page).to have_content 'ativada'
end
end