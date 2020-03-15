class AddFieldsToUsers < ActiveRecord::Migration
  def up
     change_table :users do |t|
      t.integer  "sign_in_count",          default: 0,    null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet     "current_sign_in_ip"
      t.inet     "last_sign_in_ip"
      t.string   "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string   "unconfirmed_email"
      t.string   "username"
      t.string   "role"
      t.string   "firstname"
      t.string   "lastname"
      t.boolean  "actual_member",          default: true
      t.boolean  "cloning_notify",         default: true
      t.boolean  "production_notify",      default: true
    end
    add_index :users, :username, unique: true
  end
end
