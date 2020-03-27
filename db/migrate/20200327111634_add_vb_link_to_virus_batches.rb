class AddVbLinkToVirusBatches < ActiveRecord::Migration
  def change
    add_column :virus_batches, :vb_link_id, :integer
    add_column :virus_batches, :vb_link_type, :string
  end
end
