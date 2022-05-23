require 'rails_helper'

describe 'User visits carrier' do
    it 'and must be authenticated' do
      visit carriers_path
      expect(current_path).to eq new_user_session_path
    end
    it 'and sees some carriers' do
      Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
      Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
      user = User.create!(email: 'kilder@gmail.com', password: 'password', admin: true)
      login_as(user)
      visit root_path 
      click_on 'Transportadoras'

      expect(current_path).to eq carriers_path
      expect(page).to have_content 'Pac'
      expect(page).to have_content '12345678901234'
      expect(page).to have_content 'pac.com.br'
      expect(page).to have_content 'Av. Republica do Libano, 145'
      expect(page).to have_content 'support@pac.com.br'

      expect(page).to have_content 'DLL'
      expect(page).to have_content '12345678901237'
      expect(page).to have_content 'dll.com.br'
      expect(page).to have_content 'Av. Geraldo Patrin, 745'
      expect(page).to have_content 'support@dll.com.br'
    end

    it 'when there are no carriers registered' do

      user = User.create!(email: 'kilder@gmail.com', password: 'password', admin: true)
      login_as(user)
      visit root_path 
      click_on 'Transportadoras'

      expect(page).to have_content 'Não há transportadoras cadastradas'
    end
end