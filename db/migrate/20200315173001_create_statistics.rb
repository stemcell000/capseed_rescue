class CreateStatistics < ActiveRecord::Migration
  def up
    create_table "statistics", force: :cascade do |t|
      t.float    "value"
      t.string   "label"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
  
  def down
    drop_table :statistics
  end
end
