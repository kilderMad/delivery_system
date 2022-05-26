class CreateOrderUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :order_updates do |t|
      t.date :date
      t.string :hour
      t.string :last_location
      t.string :next_location
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
