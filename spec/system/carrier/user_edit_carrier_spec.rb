require 'rails_helper'

describe 'User edit carrier' do
  it 'and must be authenticated' do
    Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    visit edit_carrier_path(1)
    expect(current_path).to eq new_user_session_path
  end
  it 'and sees filled fields ' do
    Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    user = User.create!(email: 'kilder@gmail.com', password: 'password')
    login_as(user)
    visit root_path
    find('#menu-desktop').click_on 'Transportadoras'
    click_on 'Pac'
    click_on 'Editar'

    expect(page).to have_content('Edição de Transportadora')
    expect(page).to have_field('Nome', with: 'Pac')
    expect(page).to have_field('CNPJ', with: '12345678901234')
    expect(page).to have_field('Endereço', with: 'Av. Republica do Libano, 145')
    expect(page).to have_field('Email', with: 'support@pac.com.br')
    expect(page).to have_field('Domínio', with: 'pac.com.br')
  end

  it 'success' do
    Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    user = User.create!(email: 'kilder@gmail.com', password: 'password')
    login_as(user)
    visit root_path
    find('#menu-desktop').click_on 'Transportadoras'
    click_on 'Pac'
    click_on 'Editar'

    fill_in 'Nome', with: 'DLL'
    fill_in 'CNPJ', with: '12345678901234'
    fill_in 'Endereço', with: 'Av. Garildo Bala, 777'
    fill_in 'Email', with: 'sac@dll.com.br'
    fill_in 'Domínio', with: 'dll.com.br'
    click_on 'Enviar'

    expect(current_path).to eq carrier_path(1)
    expect(page).to have_content 'Transportadora atualizada com sucesso.'
    expect(page).to have_content 'DLL'
    expect(page).to have_content '12345678901234'
    expect(page).to have_content 'Av. Garildo Bala, 777'
    expect(page).to have_content 'sac@dll.com.br'
    expect(page).to have_content 'dll.com.br'
  end

  it 'with blank fields' do
    Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    user = User.create!(email: 'kilder@gmail.com', password: 'password')
    login_as(user)
    visit root_path
    find('#menu-desktop').click_on 'Transportadoras'
    click_on 'Pac'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Email', with: 'sac@cdll.com.br'
    fill_in 'Domínio', with: 'cdll.com.br'
    fill_in 'Endereço', with: 'Av Firula, 200'
    click_on 'Enviar'

    expect(page).to have_content 'Preencha os campos corretamente'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
  end
end
