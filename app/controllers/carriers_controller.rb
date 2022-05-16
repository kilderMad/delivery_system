class CarriersController < ApplicationController
  def index
    @carriers = Carrier.all
  end

  def show
    @carrier = Carrier.find(params[:id])
  end

  def new
    @carrier = Carrier.new
  end

  def create
    carrier_params = params.require(:carrier).permit(:fantasy_name, :cnpj, :domain, :email, :address)

    @carrier = Carrier.new(carrier_params)

    if @carrier.save
      redirect_to @carrier, notice: 'Transportadora cadastrada com sucesso.'
    else
      flash.now[:notice] = 'Preencha os campos corretamente'
      render :new
    end
  end
end