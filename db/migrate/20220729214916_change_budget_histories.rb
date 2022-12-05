class ChangeBudgetHistories < ActiveRecord::Migration[7.0]
  def change
    change_table :budget_histories do |t|
      t.string :zip_code
      t.remove :distance, :weight
    end
  end
end
