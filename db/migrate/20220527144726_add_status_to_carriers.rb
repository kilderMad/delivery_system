class AddStatusToCarriers < ActiveRecord::Migration[7.0]
  def change
    add_column :carriers, :status, :integer, default: 1
  end
end
