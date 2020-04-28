class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :name
      t.string :barcode
      t.integer :container_id
      t.timestamps null: false
    end
  end
end