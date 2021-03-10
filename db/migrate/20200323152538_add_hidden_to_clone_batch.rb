class AddHiddenToCloneBatch < ActiveRecord::Migration[5.0]
  def change
    add_column :clone_batches, :hidden, :boolean
  end
end
