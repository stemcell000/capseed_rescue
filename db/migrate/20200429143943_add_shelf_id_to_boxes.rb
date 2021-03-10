class AddShelfIdToBoxes < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :shelf_id, :integer
  end
end
