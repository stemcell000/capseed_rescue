class AddRecapToPlasmidBatch < ActiveRecord::Migration[6.0]
  def change
    add_column :plasmid_batches, :recap, :string
  end
end
