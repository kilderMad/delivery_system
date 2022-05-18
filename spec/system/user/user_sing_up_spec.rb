require 'rails_helper'

describe 'User sing up' do
  it 'success' do
    
    visit root_path
    click_on 'Entrar'
    click_on 'Cadastrar-se'
    fill_in 'E-mail', with: 'kilder@live.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Cadastrar'
    
    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'kilder@live.com'
    expect(page).to have_button 'Sair'
  end
end