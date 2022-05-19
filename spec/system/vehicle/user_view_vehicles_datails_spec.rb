require 'rails_helper'

describe 'User click on details of vehicle' do
  it 'and sees vehicle details' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    vehicle = Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    user = User.create!(email: 'kilder@gmail.com', password: 'password', carrier: carrier)
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Detalhes'

    expect(current_path).to eq carrier_vehicle_path(1, 1)
    expect(page).to have_content 'PCL-2932'
  end
end