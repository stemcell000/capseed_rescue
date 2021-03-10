class CreateOptionVirusProductions < ActiveRecord::Migration[5.0]
  def up
    create_table "options_virus_productions", force: :cascade do |t|
      t.integer  "option_id", index: true
      t.integer  "virus_production_id", index: true
      t.datetime "created_at",          null: false
      t.datetime "updated_at",          null: false
    end
  end
  
  def down
    drop_table :options_virus_productions
  end
end
