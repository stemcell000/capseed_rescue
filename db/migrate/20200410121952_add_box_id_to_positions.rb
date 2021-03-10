class AddBoxIdToPositions < ActiveRecord::Migration[5.0]
  def up
    add_column :positions, :box_id, :integer
  end
  
  def down
    remove_column :positions, :box_id
  end
end
