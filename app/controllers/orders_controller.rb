class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :accept, :reject]

  def index
    if current_user && !current_user.admin?
      @orders = current_user.carrier.orders.where(status: [1,2,4,5])
      @carrier = current_user.carrier
      @vehicles = current_user.carrier.vehicles
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

  def accept
    order = Order.find(params[:id])
    order.status = 'Aceito'
    order.save
    redirect_to orders_path
  end

  def reject
    order = Order.find(params[:id])
    order.status = 'Recusado'
    order.save
    redirect_to orders_path
  end

  def select_vehicle
    order = Order.find(params[:id])
    order.vehicle_id = params[:vehicle_id]
    order.save
    redirect_to orders_path
  end
end