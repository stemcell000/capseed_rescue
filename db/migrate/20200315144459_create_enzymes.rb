class CreateEnzymes < ActiveRecord::Migration
  def up
    create_table :enzymes do |t|
      t.string :name
      t.timestamps null: false
    end
  end
  
  def down
    drop_table :enzymes
  end
end
