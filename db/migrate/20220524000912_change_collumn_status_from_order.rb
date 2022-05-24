class ChangeCollumnStatusFromOrder < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:orders, :status, default: 1)
  end
end
