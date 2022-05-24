class OrdersController < ApplicationController
  def index
    if current_user && !current_user.admin?
      @orders = current_user.carrier.orders
      @carrier = current_user.carrier
    else
      @orders = Order.all
    end
    
  end

  def new
    
  end

  def create
    
  end
end