class AddColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :zip_code, :string
    remove_column :orders, :weight
    remove_column :orders, :distance
  end
end
