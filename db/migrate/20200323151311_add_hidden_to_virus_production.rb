class AddHiddenToVirusProduction < ActiveRecord::Migration[5.0]
  def change
    add_column :virus_productions, :hidden, :boolean
  end
end
