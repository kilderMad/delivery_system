require 'rails_helper'

describe 'User sees vehicles' do
  it 'on your page' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    Vehicle.create!(plate: 'PCL-2932', brand: 'Pegeot', model: 'Partner', year: '2022', capacity: 3000, carrier: carrier)
    user = User.create!(email: 'kilder@gmail.com', password: 'password', carrier: carrier)
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    
    expect(page).to have_content 'Pegeot'
    expect(page).to have_content 'Partner'
    expect(page).to have_content 'PCL-2932'
  end
end