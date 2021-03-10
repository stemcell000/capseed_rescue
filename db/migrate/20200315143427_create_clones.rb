class CreateClones < ActiveRecord::Migration[5.0]
  def up
  create_table "clones", force: :cascade do |t|
    t.integer  "assay_id"
    t.string   "name"
    t.string   "bbnb"
    t.integer  "batch_nb"
    t.string   "primerinsfor"
    t.string   "primerinsrev"
    t.text     "comment"
    t.text     "comment_batch"
    t.integer  "strict_validation", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "cmeth_id"
    t.integer  "primer_f_id"
    t.integer  "primer_r_id"
  end
  
  def down
    drop_table :clones
  end
  end
end
