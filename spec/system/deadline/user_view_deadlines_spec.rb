require 'rails_helper'

describe 'User visits time_arrive' do
  it 'and sees times to arrive' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Deadline.create!(distance_min: 0, distance_max: 600, time_arrive: 2, carrier: carrier)
    Deadline.create!(distance_min: 601, distance_max: 1200, time_arrive: 4, carrier: carrier)
    Deadline.create!(distance_min: 1201, distance_max: 2000, time_arrive: 8, carrier: carrier)
    Deadline.create!(distance_min: 2001, distance_max: 4500, time_arrive: 15, carrier: carrier)    
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path
    click_on 'Tabela de prazos'

    expect(current_path).to eq carrier_deadlines_path(carrier)
    expect(page).to have_content '0km a 600km'
    expect(page).to have_content '601km a 1200km'
    expect(page).to have_content '8 dias'
    expect(page).to have_content '15 dias'

  end

  it 'and when there are no times registered' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path
    click_on 'Tabela de prazos'

    expect(current_path).to eq carrier_deadlines_path(carrier)
    expect(page).to have_content 'Não há Prazos cadastrados'
  end
end