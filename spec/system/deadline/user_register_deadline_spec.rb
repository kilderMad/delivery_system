require 'rails_helper'

describe 'User register new deadline' do
  it 'and must be authenticated' do
    carrier = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    visit new_carrier_deadline_path(1)
    expect(current_path).to eq new_user_session_path
  end
  it 'success 1/1' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path
    within('nav') do
      click_on 'Tabela de prazos'
    end    
    click_on 'Cadastrar novo'
    
    fill_in 'Distancia mínima', with: '0'
    fill_in 'Distancia maxima', with: '1000'
    fill_in 'Tempo de entrega', with: '3'
    click_on 'Enviar'

    expect(page).to have_content '0km a 1000km'
    expect(page).to have_content '3 dias'
  end

  it 'success 2/2' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    within('nav') do
      click_on 'Tabela de prazos'
    end  
    click_on 'Cadastrar novo'
    
    fill_in 'Distancia mínima', with: '0'
    fill_in 'Distancia maxima', with: '1000'
    fill_in 'Tempo de entrega', with: '3'
    click_on 'Enviar'
    click_on 'Cadastrar novo'

    fill_in 'Distancia mínima', with: '1001'
    fill_in 'Distancia maxima', with: '2000'
    fill_in 'Tempo de entrega', with: '5'
    click_on 'Enviar'

    expect(page).to have_content '0km a 1000km'
    expect(page).to have_content '3 dias'

    expect(page).to have_content '1001km a 2000km'
    expect(page).to have_content '5 dias'
    
  end

  it 'with blank fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    within('nav') do
      click_on 'Tabela de prazos'
    end  
    click_on 'Cadastrar novo'
    click_on 'Enviar'

    expect(page).to have_content 'Distancia mínima não pode ficar em branco'
    expect(page).to have_content 'Distancia maxima não pode ficar em branco'
    expect(page).to have_content 'Tempo de entrega não pode ficar em branco'
  end
end