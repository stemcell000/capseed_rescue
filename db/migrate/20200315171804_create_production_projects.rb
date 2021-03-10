class CreateProductionProjects < ActiveRecord::Migration[5.0]
  def up
  create_table "productions_projects", force: :cascade do |t|
    t.integer "production_id", index: true
    t.integer "project_id", index: true
  end
  end
  
  def down
    drop_table :productions_projects
  end
end
