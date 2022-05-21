class DeadlinesController < ApplicationController
  def index
    if current_user && !current_user.admin?
      @carrier = Carrier.find(params[:carrier_id])
      @deadlines = @carrier.deadlines    
    end
  end
end