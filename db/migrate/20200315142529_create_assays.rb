class CreateAssays < ActiveRecord::Migration[5.0]
  def up
    create_table :assays do |t|
      t.string :name
      t.boolean :display
      t.integer :step, :default =>0
      t.integer :row_order
      t.boolean :locked, :default => false
      t.integer :last_step, :default => 0
      t.date :today_date
      t.float :percentage, :default => 0
      t.integer :user_id
      t.timestamps null: false
    end
  end
  
  def down
    drop_table :assays
  end
end
