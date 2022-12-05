class HomeController < ApplicationController
  def index
    return unless user_signed_in? && !current_user.admin?

    @carrier = current_user.carrier
  end
end
