class AddBoxFormatIdToBoxes < ActiveRecord::Migration
  def up
    add_column :boxes, :box_format_id, :integer
    add_index :boxes, :box_format_id
  end
end
