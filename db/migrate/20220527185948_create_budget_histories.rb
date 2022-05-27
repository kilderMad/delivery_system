class CreateBudgetHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_histories do |t|
      t.decimal :freight
      t.integer :deadline
      t.decimal :weight
      t.integer :distance
      t.decimal :cubic_size
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
