require 'rails_helper'

describe 'user register new order' do
  it 'success' do
    carrier = Carrier.create!(fantasy_name: 'DLL', cnpj: '12345678901237', domain: 'dll.com.br', address: 'Av. Geraldo Patrin, 745', email: 'support@dll.com.br')
    user = User.create!(email: 'kilder@gmail.com.br', password: 'password')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCBV1234512345')
    login_as(user)
    visit root_path
    click_on 'Pedidos'
    click_on 'Cadastrar novo'
    
    fill_in 'Peso', with: '10'
    fill_in 'Metros cúbicos', with: '1'
    #fill_in 'Prazo', with: '6' #trocar pra automatico
    fill_in 'Destinatário', with: 'Kilder costa filho'
    fill_in 'CPF', with: '71319927790'
    fill_in 'Telephone', with: '81981316988'
    fill_in 'Endereço de entrega', with: 'Rua cambui, 1, zumbi, Recife/PE'
    fill_in 'Endereço de retirada', with: 'Av. São paulo, 123'
    select 'DLL', from: 'Transportadora'
    click_on 'Enviar'

    expect(current_path).to eq orders_path
    expect(page).to have_content 'Pedido: ABCBV1234512345'
    expect(page).to have_content 'Status: Pendente de aceite'
    expect(page).to have_content 'Transportadora: DLL'
    expect(page).to have_content 'Dimensão em M cúbicos: 1.0'
    expect(page).to have_content 'Peso: 10.0kg'
    expect(page).to have_content 'Prazo: '
    expect(page).to have_content 'Endereço de retirada: Av. São paulo, 123'
    expect(page).to have_content 'Endereço de entrega: Rua cambui, 1, zumbi, Recife/PE'
    expect(page).to have_content 'Informações do destinatario'
    expect(page).to have_content 'Kilder costa filho'
    expect(page).to have_content 'CPF: 71319927790'
    expect(page).to have_content 'Telephone: 81981316988'
  end

  it 'with blank fields' do
    
  end
end