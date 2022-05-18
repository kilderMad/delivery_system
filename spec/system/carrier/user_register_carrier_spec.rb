require 'rails_helper'

describe 'User register carrier' do
  it 'success' do
    user = User.create!(email: 'kilder@gmail.com', password: 'password', admin: true)
    login_as(user)
    visit root_path
    click_on 'Transportadoras'
    click_on 'Cadastrar'

    fill_in 'Nome', with: 'DLL'
    fill_in 'CNPJ', with: '12345678901234'
    fill_in 'Endereço', with: 'Av. Garildo Bala, 777'
    fill_in 'Email', with: 'sac@dll.com.br'
    fill_in 'Domínio', with: 'dll.com.br'
    click_on 'Enviar'

    expect(current_path).to eq carrier_path(1)
    expect(page).to have_content 'Transportadora cadastrada com sucesso.'
    expect(page).to have_content 'DLL'
    expect(page).to have_content '12345678901234'
    expect(page).to have_content 'Av. Garildo Bala, 777'
    expect(page).to have_content 'sac@dll.com.br'
    expect(page).to have_content 'dll.com.br'
  end

  it 'with blank fields' do
    user = User.create!(email: 'kilder@gmail.com', password: 'password', admin: true)
    login_as(user)
    visit root_path
    click_on 'Transportadoras'
    click_on 'Cadastrar'
    click_on 'Enviar'

    expect(page).to have_content 'Preencha os campos corretamente'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'Domínio não pode ficar em branco'
    expect(page).to have_content 'Email não pode ficar em branco'

  end
end