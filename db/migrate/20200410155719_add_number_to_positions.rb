class AddNumberToPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :nb, :integer
  end
end
