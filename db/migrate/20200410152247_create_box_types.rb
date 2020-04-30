class CreateBoxTypes < ActiveRecord::Migration
  def change
    create_table :box_types do |t|
      t.string :name
      t.integer :max_position
      t.text :comment

      t.timestamps null: false
    end
  end
end
