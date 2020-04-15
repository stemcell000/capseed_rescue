class AddBoxTypeIdToBoxe < ActiveRecord::Migration
  def change
    add_column :boxes, :box_type_id, :integer
  end
end
