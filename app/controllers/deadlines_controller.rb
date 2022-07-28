class DeadlinesController < ApplicationController
  before_action :authenticate_user!
  def index
    return unless current_user && !current_user.admin?

    @carrier = Carrier.find(params[:carrier_id])
    @deadlines = @carrier.deadlines
  end

  def new
    return unless current_user && !current_user.admin?

    @carrier = Carrier.find(params[:carrier_id])
    @deadlines = @carrier.deadlines
    @deadline = Deadline.new
  end

  def create
    @carrier = Carrier.find(params[:carrier_id])
    deadline_params = params.require(:deadline).permit(:distance_min, :distance_max, :time_arrive, :carrier_id)
    @deadline = @carrier.deadlines.new(deadline_params)
    if @deadline.save
      redirect_to carrier_deadlines_path(@carrier), notice: 'Prazo de entrega cadastrado com sucesso'
    else
      render :new
    end
  end

  def edit
    @carrier = Carrier.find(params[:carrier_id])
    @deadline = Deadline.find(params[:id])
  end

  def update
    @carrier = Carrier.find(params[:carrier_id])
    deadline_params = params.require(:deadline).permit(:distance_min, :distance_max, :time_arrive, :carrier_id)
    @deadline = Deadline.find(params[:id])
    if @deadline.update(deadline_params)
      redirect_to carrier_deadlines_path(@carrier), notice: 'Prazo de entrega atualizado com sucesso'
    else
      render :edit
    end
  end
end
