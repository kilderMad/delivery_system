require 'rails_helper'

describe 'User click on details of vehicle' do
  it 'and must be authenticated' do
    carrier = Carrier.create!(fantasy_name: 'Pac', cnpj: '12345678901234', domain: 'pac.com.br', address: 'Av. Republica do Libano, 145', email: 'support@pac.com.br')
    Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    visit carrier_vehicle_path(1, 1)
    expect(current_path).to eq new_user_session_path
  end
  it 'and sees vehicle details' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    vehicle = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    user = User.create!(email: 'kilder@dll.com.br', password: 'password')
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Detalhes'

    expect(current_path).to eq carrier_vehicle_path(1, 1)
    expect(page).to have_content 'PCL-2932'
  end
end