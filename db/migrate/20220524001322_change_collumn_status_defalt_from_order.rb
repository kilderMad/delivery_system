class ChangeCollumnStatusDefaltFromOrder < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:orders, :status, 1)
  end
end
