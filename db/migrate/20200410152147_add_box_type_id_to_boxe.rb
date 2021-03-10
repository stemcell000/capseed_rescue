class AddBoxTypeIdToBoxe < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :box_type_id, :integer
  end
end
