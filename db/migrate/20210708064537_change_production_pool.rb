class ChangeProductionPool < ActiveRecord::Migration[6.0]
  def change
    change_column :productions, :pool, :boolean, default: false
  end
end
