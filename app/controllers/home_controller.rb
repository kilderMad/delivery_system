class HomeController < ApplicationController
  def index 
    if current_user && !current_user.admin?
      @carrier_id = current_user
    end
  end
end