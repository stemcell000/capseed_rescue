class AddShelfIdToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :shelf_id, :integer
  end
end
