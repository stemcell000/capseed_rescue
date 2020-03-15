class CreateInserts < ActiveRecord::Migration
  def change
  create_table "inserts", force: :cascade do |t|
    t.integer  "clone_batch_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.integer  "dismissed",      default: 0
  end
  end
end
