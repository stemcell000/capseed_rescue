class CreateProductions < ActiveRecord::Migration
  def up
    create_table "productions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "display"
    t.integer  "step",              default: 0
    t.text     "comment"
    t.integer  "row_order"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "target"
    t.integer  "last_step",         default: 0
    t.date     "order_date"
    t.float    "percentage",        default: 0.0
    t.boolean  "locked",            default: false
    t.integer  "strict_validation"
    t.boolean  "pool"
    t.date     "today_date"
    t.decimal  "production_volume"
    t.string   "cbtag"
    t.string   "pbtag"
    t.boolean  "disable_switch",    default: false
  end
  end
  
  def down
    drop_table :productions
  end
end
