class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :return404

  private

  def return404
    render status: 404
  end
end
