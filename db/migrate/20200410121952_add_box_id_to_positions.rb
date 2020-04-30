class AddBoxIdToPositions < ActiveRecord::Migration
  def up
    add_column :positions, :box_id, :integer
  end
  
  def down
    remove_column :positions, :box_id
  end
end
