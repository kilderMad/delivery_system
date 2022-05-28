require 'rails_helper'

describe 'User visit home' do
  it 'and view Sistema de Entregas' do
    visit root_path

    expect(page).to have_content 'Home'
  end
end