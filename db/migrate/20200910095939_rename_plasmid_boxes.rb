class RenamePlasmidBoxes < ActiveRecord::Migration
  def change
    rename_table :plasmid_boxes, :pboxes
    rename_column :plasmid_batches, :plasmid_box_id, :pbox_id
  end
end
