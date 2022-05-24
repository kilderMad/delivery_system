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
    if current_user && current_user.admin?
      @order = Order.new
      @carriers = Carrier.all
    end
  end

  def create
    @carriers = Carrier.all
    params_order = params.require(:order).permit(:status, :code, :cubic_size, :pickup_address, :receiver_address, :receiver_cpf, :receiver_name, :receiver_phone, :weight, :carrier_id, :deadline, :distance, :price)
    @order = Order.new(params_order)
    if @order.save
      redirect_to orders_path, notice: 'Pedido registrado e enviado com sucesso'
    else
      render :new
    end
  end
end