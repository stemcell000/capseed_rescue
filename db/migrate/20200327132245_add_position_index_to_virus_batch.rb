class AddPositionIndexToVirusBatch < ActiveRecord::Migration
  def up
    add_column :virus_batches, :position_id, :integer
    add_index :virus_batches, :position_id
  end
  
  def down
    remove_column :virus_batches, :position_id
  end
end
