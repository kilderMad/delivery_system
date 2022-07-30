class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update accept reject finish budgets]

  def index
    if current_user && !current_user.admin?
      @orders = current_user.carrier.orders.where(status: [1, 2, 4, 5, 6])
      @carrier = current_user.carrier
      @vehicles = current_user.carrier.vehicles
    else
      @orders = Order.all
    end
  end

  def new
    return unless current_user&.admin?

    @order = Order.new
    @carriers = Carrier.all
  end

  def create
    @carriers = Carrier.all
    params_order = params.require(:order).permit(:status, :code, :cubic_size, :pickup_address, :receiver_address,
                                                 :receiver_cpf, :receiver_name, :receiver_phone, :carrier_id,
                                                 :deadline, :price, :zip_code)
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
    current_user && @carrier = current_user.carrier

    @code = params['query']
    @code && @order = Order.find_by('code LIKE ?', "%#{@code}%")

    if @order
      @order_updates = @order.order_updates
    else
      redirect_to root_path, notice: 'Código não encontrado'
    end
  end

  def budgets
    current_user && @carrier = current_user.carrier
    @cubic_size = params[:cubic_size]
    @cep = params[:cep]

    return unless (@budgets = []) && Services.ask_cep(@cep)

    @budgets = Price.where('cbm_min <= ? AND cbm_max >= ? AND state = ?',
                           @cubic_size, @cubic_size, Services.ask_cep(@cep))
    @budgets.each do |budget|
      BudgetHistory.create(carrier: budget.carrier, freight: budget.value, deadline: budget.deadline,
                           zip_code: @cep, cubic_size: @cubic_size)
    end
  end
end
