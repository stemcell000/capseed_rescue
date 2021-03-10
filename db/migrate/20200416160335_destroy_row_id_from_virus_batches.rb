class DestroyRowIdFromVirusBatches < ActiveRecord::Migration[5.0]
  def up
    remove_column :virus_batches, :row_id
  end
  
  def down
    add_column :virus_batches, :row_id, :integer
  end
end
