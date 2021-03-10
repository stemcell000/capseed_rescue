class RemoveVbLinkFromVirusBatches < ActiveRecord::Migration[5.0]
  def up
    remove_column :virus_batches, :vb_link_id
    remove_column :virus_batches, :vb_link_type
  end
  
  def down
    add_column :virus_batches, :vb_link_id, :integer
    add_column :virus_batches, :vb_link_type, :string
  end
end
