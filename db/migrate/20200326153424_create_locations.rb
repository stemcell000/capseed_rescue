class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :barcode
      t.integer :building_id
      t.timestamps null: false
    end
  end
end
