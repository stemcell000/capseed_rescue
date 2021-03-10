class CreateCloneProjects < ActiveRecord::Migration[5.0]
  def up
  create_table "clones_projects", force: :cascade do |t|
    t.integer "clone_id", index: true
    t.integer "project_id", index: true
  end
  end
  
  def dowb
    drop_table :clones_projects
  end
end
