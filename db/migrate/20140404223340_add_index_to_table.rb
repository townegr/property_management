class AddIndexToTable < ActiveRecord::Migration
  def change
    add_column :building_records, :owner_id, :integer
    add_index :building_records, :owner_id
  end
end
