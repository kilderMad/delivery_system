class CreateCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :carriers do |t|
      t.string :fantasy_name
      t.string :cnpj
      t.string :domain
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
