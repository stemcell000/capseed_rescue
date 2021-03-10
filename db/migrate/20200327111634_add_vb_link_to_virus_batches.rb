class AddVbLinkToVirusBatches < ActiveRecord::Migration[5.0]
  def change
    add_column :virus_batches, :vb_link_id, :integer
    add_column :virus_batches, :vb_link_type, :string
  end
end
