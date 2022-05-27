class BudgetHistoriesController < ApplicationController
  def index 
    if current_user
      @carrier
    end
    @budget_histories = BudgetHistory.all
  end
end