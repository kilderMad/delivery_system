class Api::V1::OrdersController < Api::V1::ApiController
  def search
    code = params[:code]
    code && order = Order.find_by('code = ?', code)
    if order
      orderJson = order.as_json(except: %i[created_at updated_at vehicle_id])
      orderJson["updates"] = order.order_updates.as_json(except: %i[created_at updated_at])
      orderJson["vehicle"] = order.vehicle
      render status: 200, json: orderJson
    else
      render status: 404, json: { message: "not found"}
    end
  end
end
