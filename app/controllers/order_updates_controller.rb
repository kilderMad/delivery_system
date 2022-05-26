class OrderUpdatesController < ApplicationController 
  before_action :authenticate_user!, only: [:new, :create]

  def index
    #@orders = Order.find(params[:order_id])
  end

  def new
    @carrier = current_user.carrier
    @order = Order.find(params[:order_id])
    @order_update = @order.order_updates.new
  end

  def create
    @carrier = current_user.carrier
    @order = Order.find(params[:order_id])
    updates_params = params.require(:order_update).permit(:order_id, :last_location, :next_location, :date, :hour)
    @order_update = @order.order_updates.new(updates_params)
    if @order_update.save
      redirect_to orders_path, notice: "Pedido atualizado com sucesso"
    else
      render :new
    end
  end
end