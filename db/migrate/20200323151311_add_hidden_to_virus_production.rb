class AddHiddenToVirusProduction < ActiveRecord::Migration
  def change
    add_column :virus_productions, :hidden, :boolean
  end
end
