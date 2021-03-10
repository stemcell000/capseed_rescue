class AddBoxNameToPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :box_name, :string
  end
end
