class AddRecapToVirusBatches < ActiveRecord::Migration
  def change
    add_column :virus_batches, :recap, :text
  end
end
