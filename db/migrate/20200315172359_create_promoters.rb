class CreatePromoters < ActiveRecord::Migration[5.0]
  def change
  create_table "promoters", force: :cascade do |t|
    t.string "name"
  end
  end
  
  def down
    drop_table :promoters
  end
end
