class AddVolumesToPlasmidBatchProduction < ActiveRecord::Migration[6.0]
  def change
    add_column :plasmid_batches_productions, :volumes, :text, array: true, default: []
  end
end
