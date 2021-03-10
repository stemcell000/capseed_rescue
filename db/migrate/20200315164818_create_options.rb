class CreateOptions < ActiveRecord::Migration[5.0]
  def up
  create_table "options", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "display_limited_virus"
    t.boolean  "display_all_virus"
    t.boolean  "display_all_clone_batch"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end
  end
  
  def down
    drop_table :options
  end
end
