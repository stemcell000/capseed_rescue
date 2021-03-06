class CreateInserts < ActiveRecord::Migration[5.0]
  def change
  create_table "inserts", force: :cascade do |t|
    t.integer  "clone_batch_id", index: true
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.integer  "dismissed",      default: 0
  end
  end
end
