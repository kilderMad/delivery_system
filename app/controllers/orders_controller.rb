class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :accept, :reject, :finish, :budgets]

  def index
    if current_user && !current_user.admin?
      @orders = current_user.carrier.orders.where(status: [1,2,4,5,6])
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

  def finish
    order = Order.find(params[:id])
    order.status = 'Finalizado'
    order.save
    redirect_to orders_path
  end

  def search
    if current_user
      @carrier = current_user.carrier
    end
    @code = params["query"]
    unless @code.empty? 
      @order = Order.find_by("code LIKE ?", "%#{@code}%")
    end
    if @order 
      @order_updates = @order.order_updates
    else
      redirect_to root_path, notice: "Código não encontrado"
    end   
  end

  def budgets
    if current_user
      @carrier = current_user.carrier
    end

    @weight = params[:weight]
    @cubic_size = params[:cubic_size]
    @distance = params[:distance]  
    
    prices = Price.where("cbm_min <= ? AND cbm_max >= ? AND weight_min <= ? AND weight_max >= ?", @cubic_size, @cubic_size, @weight, @weight)
    deadlines = Deadline.where("distance_min <= ? AND distance_max >= ?", @distance, @distance)
    @results = []
    prices.each do |price|      
      deadlines.each do |dl|
        carrier = {}
        if price.carrier_id == dl.carrier_id && dl.carrier.active? && price.carrier.active?
          carrier[:frete] = price.value_km * @distance.to_i
          carrier[:deadline] = dl.time_arrive
          carrier[:company] = dl.carrier.fantasy_name
          @results << carrier
          history = BudgetHistory.create(carrier_id: dl.carrier_id, freight: price.value_km * @distance.to_i, deadline: dl.time_arrive, weight: @weight, distance: @distance, cubic_size: @cubic_size)       
        end
      end    
    end
  end
end