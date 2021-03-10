class CreateProjects < ActiveRecord::Migration[5.0]
  def up
    create_table :projects do |t|
      t.string :name
      t.timestamps null: false
    end
   
   def down
     drop_table :projects
   end
  end
end
