class CreateTargets < ActiveRecord::Migration
  def up
  create_table "targets", force: :cascade do |t|
    t.string "name"
  end
  end
  
  def down
    drop_table :targets
  end
end
