class RenameBoxIdFromPlasmidBatches < ActiveRecord::Migration[5.0]
  def up
    rename_column :plasmid_batches, :box_id, :plasmid_box_id
  end
  def down
    rename_column :plasmid_batches, :plasmid_box_id, :box_id 
  end
end
