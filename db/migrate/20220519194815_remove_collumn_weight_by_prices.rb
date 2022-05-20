class RemoveCollumnWeightByPrices < ActiveRecord::Migration[7.0]
  def change
    remove_column(:prices, :weight)
    add_column(:prices, :weight_min, :decimal)
    add_column(:prices, :weight_max, :decimal)
  end
end
