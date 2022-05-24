class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :code
      t.integer :status
      t.decimal :cubic_size
      t.decimal :weight
      t.string :pickup_address
      t.string :receiver_address
      t.string :receiver_name
      t.string :receiver_cpf
      t.string :receiver_phone
      t.integer :deadline, null: true
      t.references :carrier, null: true, foreign_key: true

      t.timestamps
    end
  end
end
