class CreateVirusProductions < ActiveRecord::Migration[5.0]
  def up
    create_table "virus_productions", force: :cascade do |t|
    t.integer  "production_id"
    t.integer  "user_id"
    t.integer  "vol_unit_id"
    t.decimal  "vol"
    t.text     "comment"
    t.string   "gel_prot"
    t.boolean  "invoice"
    t.text     "hek_result"
    t.string   "animal"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.date     "date_of_production"
    t.string   "number"
    t.string   "plasmid_tag"
    t.string   "plasmid_batch_tag"
    t.string   "rev_plasmid_tag"
    t.string   "rev_plasmid_batch_tag"
    t.integer  "nb"
    t.string   "genes_tag"
    t.string   "promoters_tag"
    t.text     "recap"
    t.integer  "dismissed",             default: 0
  end
  end
  
  def down
    drop_table :virus_batches
  end
end
