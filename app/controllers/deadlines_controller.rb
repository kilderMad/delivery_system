class DeadlinesController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user && !current_user.admin?
      @carrier = Carrier.find(params[:carrier_id])
      @deadlines = @carrier.deadlines    
    end
  end

  def new
    if current_user && !current_user.admin?
      @carrier = Carrier.find(params[:carrier_id])
      @deadlines = @carrier.deadlines
      @deadline = Deadline.new    
    end
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
end