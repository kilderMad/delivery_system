class AddCollumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :price, :decimal
    add_column :orders, :distance, :integer
  end
end
