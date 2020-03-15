class CreateCloneProjects < ActiveRecord::Migration
  def up
  create_table "clones_projects", force: :cascade do |t|
    t.integer "clone_id"
    t.integer "project_id"
  end
  end
  
  def dowb
    drop_table :clones_projects
  end
end
