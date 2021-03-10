class AddRecapToVirusBatches < ActiveRecord::Migration[5.0]
  def change
    add_column :virus_batches, :recap, :text
  end
end
