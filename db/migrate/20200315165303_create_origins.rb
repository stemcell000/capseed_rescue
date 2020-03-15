class CreateOrigins < ActiveRecord::Migration
  def up
    create_table "origins", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
  
  def down
    drop_table :origins
  end
end
