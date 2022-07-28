class ChangePrices < ActiveRecord::Migration[7.0]
  def change
    change_table :prices do |t|
      t.remove :weight_min
      t.remove :weight_max
      t.rename :value_km, :value
      t.string :state
    end
  end
end
