class CreateTargets < ActiveRecord::Migration[5.0]
  def up
  create_table "targets", force: :cascade do |t|
    t.string "name"
  end
  end
  
  def down
    drop_table :targets
  end
end
