class AddBoxNameToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :box_name, :string
  end
end
