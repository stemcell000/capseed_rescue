class AddBoxFormatIdToBoxes < ActiveRecord::Migration
  def up
    add_column :boxes, :box_format_id, :integer
    add_column :boxes, :box_format_id
  end
end
