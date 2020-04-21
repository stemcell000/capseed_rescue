class DestroyColumnIdFromVirusBatches < ActiveRecord::Migration
  def up
    remove_column :virus_batches, :column_id
  end
  
  def down
    add_column :virus_batches, :column_id, :integer
  end
end
