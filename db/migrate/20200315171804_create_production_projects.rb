class CreateProductionProjects < ActiveRecord::Migration
  def up
  create_table "productions_projects", force: :cascade do |t|
    t.integer "production_id"
    t.integer "project_id"
  end
  end
  
  def down
    drop_table :productions_projects
  end
end
