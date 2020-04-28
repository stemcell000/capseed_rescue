class AddColAndRowIndexToBoxType < ActiveRecord::Migration
  def up
    add_column :box_types, :vertical_max, :integer
    add_column :box_types, :horizontal_max, :integer
  end
  
  def down
    remove_column :box_types, :vertical_max
    remove_column :box_types, :horizontal_max
  end
end