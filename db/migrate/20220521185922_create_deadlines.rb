class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.integer :distance_min
      t.integer :distance_max
      t.integer :time_arrive
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
