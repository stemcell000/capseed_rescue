class RemoveBoxIdFromVirusBatches < ActiveRecord::Migration[5.0]
  def up
    remove_column :virus_batches, :box_id
  end
  
  def down
    add_column :virus_batches, :box_id, :integer
  end
end
