class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|

      t.timestamps null: false
    end
  end
end
