class CreateProjects < ActiveRecord::Migration
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
