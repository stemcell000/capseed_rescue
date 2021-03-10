class CreatePlasmidBoxes < ActiveRecord::Migration[5.0]
  def up
    create_table :plasmid_boxes do |t|
      t.string :name
      t.string :barcode
      t.timestamps null: false
    end
  end
  def down
    drop_table :plasmid_boxes
  end
end
