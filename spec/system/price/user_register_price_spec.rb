require 'rails_helper'

describe 'User register new price' do
  it 'success 1/1' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@gmail.com', password: 'password', carrier: carrier)
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    
    fill_in 'Metros cúbicos min', with: '0.001'
    fill_in 'Metros cúbicos max', with: '0.5'
    fill_in 'Peso min', with: '0.0'
    fill_in 'Peso max', with: '10.0'
    fill_in 'Valor por km', with: '0.5'
    click_on 'Enviar'

    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content '0.0kg a 10.0kg'
    expect(page).to have_content 'R$ 0.5'
  end

  it 'success 2/2' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@gmail.com', password: 'password', carrier: carrier)
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    
    fill_in 'Metros cúbicos min', with: '0.001'
    fill_in 'Metros cúbicos max', with: '0.5'
    fill_in 'Peso min', with: '0.0'
    fill_in 'Peso max', with: '10.0'
    fill_in 'Valor por km', with: '0.5'
    click_on 'Enviar'

    fill_in 'Metros cúbicos min', with: '0.001'
    fill_in 'Metros cúbicos max', with: '0.5'
    fill_in 'Peso min', with: '11.0'
    fill_in 'Peso max', with: '50.0'
    fill_in 'Valor por km', with: '1.5'
    click_on 'Enviar'

    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content '11.0kg a 50.0kg'
    expect(page).to have_content 'R$ 1.5'

    expect(page).to have_content '0.001 a 0.5'
    expect(page).to have_content '0.0kg a 10.0kg'
    expect(page).to have_content 'R$ 0.5'
    
  end

  it 'with blank fields' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@gmail.com', password: 'password', carrier: carrier)
    login_as(user)

    visit root_path

    click_on 'Dashboard'
    click_on 'Tabela de preços'
    click_on 'Enviar'

    expect(page).to have_content 'Metros cúbicos min não pode ficar em branco'
    expect(page).to have_content 'Metros cúbicos max não pode ficar em branco'
    expect(page).to have_content 'Peso min não pode ficar em branco'
    expect(page).to have_content 'Peso max não pode ficar em branco'
    expect(page).to have_content 'Valor por km não pode ficar em branco'
  end
end