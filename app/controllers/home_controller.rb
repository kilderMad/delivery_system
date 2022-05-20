class HomeController < ApplicationController
  def index 
    if user_signed_in? && !current_user.admin?
      @carrier = current_user.carrier
    end 
    #lembrar do erro de usuario que pode nao estar vinculado a transportadora...exibir erro oupermitir so cadastrar com o dominio ja existente
  end
end