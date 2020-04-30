class RemoveBoxIdFromVirusBatches < ActiveRecord::Migration
  def up
    remove_column :virus_batches, :box_id
  end
  
  def down
    add_columns :virus_batches, :box_id, :integer
  end
end
