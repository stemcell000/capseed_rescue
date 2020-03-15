class CreatePcrColonyQcAttachments < ActiveRecord::Migration
  def change
    create_table :pcr_colony_qc_attachments do |t|

      t.timestamps null: false
    end
  end
end
