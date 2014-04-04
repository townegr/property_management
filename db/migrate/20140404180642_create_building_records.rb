class CreateBuildingRecords < ActiveRecord::Migration
  def change
    create_table :building_records do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.text :description

      t.timestamps
    end
  end
end
