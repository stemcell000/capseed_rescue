class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.string :name
      t.string :barcode
      t.integer :location_id
      t.timestamps null: false
    end
  end
end
