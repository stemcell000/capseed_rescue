class CreateRows < ActiveRecord::Migration
  def up
    create_table "rows", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
  
  def down
    drop_table :rows
  end
end
