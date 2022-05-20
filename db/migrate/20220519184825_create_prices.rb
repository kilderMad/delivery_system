class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.decimal :cbm_min
      t.decimal :cbm_max
      t.integer :weight
      t.decimal :value_km
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
