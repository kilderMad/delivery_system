class PricesController < ApplicationController 
  before_action :authenticate_user!
  def index
    if current_user && !current_user.admin?  
      @carrier = Carrier.find(params[:carrier_id])
      @prices = @carrier.prices
    end
  end
  def new  
    if current_user && !current_user.admin?  
      @carrier = Carrier.find(params[:carrier_id])
      @prices = @carrier.prices
      @price = Price.new
    end
  end

  def create
    if current_user && !current_user.admin?  
      @carrier = Carrier.find(params[:carrier_id])
      @prices = @carrier.prices
      price_params = params.require(:price).permit(:cbm_max, :cbm_min, :weight_min, :weight_max, :value_km, :carrier_id)
      @price = @carrier.prices.new(price_params)
      if @price.save
        redirect_to carrier_prices_path(@carrier)
      else
        render :new
      end
    end
  end

  def edit
    if current_user && !current_user.admin?
      @carrier = Carrier.find(params[:carrier_id])
      @prices = @carrier.prices
      @price = Price.find(params[:id])
    end
  end

  def update
    if current_user && !current_user.admin?        
      @carrier = Carrier.find(params[:carrier_id])
      price_params = params.require(:price).permit(:cbm_max, :cbm_min, :weight_min, :weight_max, :value_km, :carrier_id)
      @price = Price.find(params[:id])
      if @price.update(price_params)
        redirect_to carrier_prices_path(@carrier)
      else        
        @prices = @carrier.prices
        render :edit
      end
    end
  end

  def destroy
    @carrier = Carrier.find(params[:carrier_id])
    Price.find(params[:id]).destroy
    redirect_to carrier_prices_path(@carrier), notice: 'Preço apagado com sucesso!'
  end
end