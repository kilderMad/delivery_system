require 'rails_helper'

describe 'User logs in' do
  it 'success' do
    User.create!(email: 'kilder123@live.com', password: 'password123', admin: true)
    
    visit root_path

    click_on 'Entrar'
    fill_in 'E-mail', with: 'kilder123@live.com'
    fill_in 'Senha', with: 'password123'
    within('form') do
      click_on 'Entrar'
    end

    expect(page).to have_content 'Login efetuado com sucesso'
    within('nav') do
      expect(page).not_to have_link 'Entrar'
      expect(page).to have_button 'Sair'
      expect(page).to have_content 'kilder123@live.com'
    end
  end

  it 'and logs out' do
    #arreange
    User.create!(email: 'kilder123@gmail.com', password: 'password123')
    #act
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'kilder123@gmail.com'
    fill_in 'Senha', with: 'password123'
    within('form') do
      click_on 'Entrar'
    end
    click_on 'Sair'

    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'kilder123@gmail.com'
  end
end