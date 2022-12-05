class BudgetHistoriesController < ApplicationController
  def index
    current_user && @carrier = current_user.carrier

    @budget_histories = BudgetHistory.all
  end
end
