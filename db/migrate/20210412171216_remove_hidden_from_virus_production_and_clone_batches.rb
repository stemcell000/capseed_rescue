class RemoveHiddenFromVirusProductionAndCloneBatches < ActiveRecord::Migration[6.0]
   def up
    remove_column :virus_productions, :hidden
    remove_column :clone_batches, :hidden
  end 	
end
