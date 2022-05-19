class VehiclesController < ApplicationController
  def show    
    @vehicle =  Vehicle.find(params[:id])
  end

  def new
    @carrier = Carrier.find(params[:carrier_id])
    @vehicle = Vehicle.new
  end

  def create
    vehicle_params = params.require(:vehicle).permit(:brand, :model, :plate, :capacity, :year)
    @carrier = Carrier.find(params[:carrier_id])
    @vehicle = @carrier.vehicles.new(vehicle_params)
    if @vehicle.save 
      redirect_to @carrier, notice: 'Veiculo cadastrado'
    else
      render :new
    end
  end
end