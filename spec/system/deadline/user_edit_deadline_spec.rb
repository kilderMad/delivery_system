require 'rails_helper'

describe 'User edit deadline' do
  it 'and must be authenticated' do
    carrier = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    Deadline.create!(distance_min: 0, distance_max: 600, time_arrive: 2, carrier: carrier)
    visit edit_carrier_deadline_path(1,1)
    expect(current_path).to eq new_user_session_path
  end
  it 'and sees filled fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Tabela de prazos'
    click_on 'Editar'

    expect(page).to have_field('Distancia mínima', with: '1201')
    expect(page).to have_field('Distancia maxima', with: '2000')
    expect(page).to have_field('Tempo de entrega', with: '8')
  end

  it 'success' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Tabela de prazos'
    click_on 'Editar'

    fill_in 'Distancia mínima', with: '0'
    fill_in 'Distancia maxima', with: '1000'
    fill_in 'Tempo de entrega', with: '4'
    click_on 'Enviar'

    expect(page).to have_content '0km a 1000km'
    expect(page).to have_content '4 dias'
  end

  it 'with blank fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Tabela de prazos'
    click_on 'Editar'

    fill_in 'Distancia mínima', with: ''
    fill_in 'Distancia maxima', with: ''
    fill_in 'Tempo de entrega', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Distancia mínima não pode ficar em branco'
    expect(page).to have_content 'Distancia maxima não pode ficar em branco'
    expect(page).to have_content 'Tempo de entrega não pode ficar em branco'
  end
end