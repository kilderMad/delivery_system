class PricesController < ApplicationController 
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
        redirect_to new_carrier_price_path(@carrier)
      else
        render :new
      end
    end
  end

  def edit
    
  end

  def update
    
  end
end