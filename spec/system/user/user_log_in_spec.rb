require 'rails_helper'

describe 'User logs in' do
  it 'with admin success' do
    User.create!(email: 'kilder123@live.com', password: 'password123')

    visit root_path

    find('#menu-desktop').click_on 'Entrar'
    fill_in 'E-mail', with: 'kilder123@live.com'
    fill_in 'Senha', with: 'password123'
    within('form') do
      click_on 'Entrar'
    end

    expect(page).to have_content 'Login efetuado com sucesso'
    within('#menu-desktop') do
      expect(page).not_to have_link 'Entrar'
      expect(page).to have_content 'Transportadoras'
      expect(page).to have_button 'Sair'
      expect(page).to have_content 'kilder123@live.com'
    end
  end

  it 'with carrier success' do
    Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    User.create!(email: 'kilder123@dll.com.br', password: 'password123')
    visit root_path

    find('#menu-desktop').click_on 'Entrar'
    fill_in 'E-mail', with: 'kilder123@dll.com.br'
    fill_in 'Senha', with: 'password123'
    within('form') do
      click_on 'Entrar'
    end

    expect(page).to have_content 'Login efetuado com sucesso'
    within('#menu-desktop') do
      expect(page).not_to have_link 'Entrar'
      expect(page).to have_content 'Dashboard'
      expect(page).to have_button 'Sair'
      expect(page).to have_content 'kilder123@dll.com.br'
    end
  end

  it 'and failed' do
    User.create!(email: 'kilder123@live.com', password: 'password123')

    visit root_path

    find('#menu-desktop').click_on 'Entrar'
    fill_in 'E-mail', with: 'kil3@live.com'
    fill_in 'Senha', with: 'password'
    within('form') do
      click_on 'Entrar'
    end

    expect(page).to have_content 'E-mail ou senha inválidos.'
    within('#menu-desktop') do
      expect(page).to have_link 'Entrar'
      expect(page).not_to have_content 'Transportadoras'
      expect(page).not_to have_button 'Sair'
      expect(page).not_to have_content 'kil3@live.com'
    end
  end

  it 'and logs out' do
    #arreange
    User.create!(email: 'kilder123@gmail.com', password: 'password123')
    #act
    visit root_path
    find('#menu-desktop').click_on 'Entrar'
    fill_in 'E-mail', with: 'kilder123@gmail.com'
    fill_in 'Senha', with: 'password123'
    within('form') do
      click_on 'Entrar'
    end
    find('#menu-desktop').click_on 'Sair'

    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'kilder123@gmail.com'
  end
end
