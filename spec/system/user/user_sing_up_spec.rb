require 'rails_helper'

describe 'User sing up' do
  it 'with admin success' do
    Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')

    visit root_path
    find('#menu-desktop').click_on 'Entrar'
    click_on 'Cadastrar-se'
    fill_in 'E-mail', with: 'kilder@live.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Cadastrar'

    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).to have_content 'Transportadoras'
      expect(page).to have_content 'kilder@live.com'
    expect(page).to have_button 'Sair'
  end

  it 'with carrier success' do
    Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')

    visit root_path
    find('#menu-desktop').click_on 'Entrar'
    click_on 'Cadastrar-se'
    fill_in 'E-mail', with: 'kilder@dll.com.br'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Cadastrar'

    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).to have_content 'Dashboard'
      expect(page).to have_content 'kilder@dll.com.br'
    expect(page).to have_button 'Sair'
  end

  it 'failed' do
    Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')

    visit root_path
    find('#menu-desktop').click_on 'Entrar'
    click_on 'Cadastrar-se'
    fill_in 'E-mail', with: ''
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Confirme sua senha'
    expect(page).to have_content 'Confirme sua senha não é igual a Senha'
    expect(page).not_to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
    expect(page).not_to have_content 'Dashboard'
    expect(page).not_to have_content 'kilder@dll.com.br'
    expect(page).to have_content 'Entrar'
  end
end
