class CreateDosages < ActiveRecord::Migration[5.0]
  def change
  create_table "dosages", force: :cascade do |t|
    t.decimal "titer"
    t.decimal "titer_atcc"
    t.decimal "titer_to_atcc"
    t.integer "virus_production_id"
    t.integer "user_id"
    t.date    "date"
    t.string  "plate_name"
    t.text    "comment"
    t.date    "inactivation"
    t.date    "inactivation_atcc"
    t.date    "inactivation_standard"
    t.boolean "accepted"
  end
  end
end
