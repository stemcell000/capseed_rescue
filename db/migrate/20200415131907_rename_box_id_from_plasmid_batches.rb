class RenameBoxIdFromPlasmidBatches < ActiveRecord::Migration
  def up
    rename_column :plasmid_batches, :box_id, :plasmis_box_id
  end
  def down
    rename_column :plasmid_batches, :plasmis_box_id, :box_id 
  end
end
