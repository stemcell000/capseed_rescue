class AddNumberToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :nb, :integer
  end
end
