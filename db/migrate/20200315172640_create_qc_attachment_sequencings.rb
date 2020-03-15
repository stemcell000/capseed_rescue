class CreateQcAttachmentSequencings < ActiveRecord::Migration
  def change
    create_table :qc_attachment_sequencings do |t|

      t.timestamps null: false
    end
  end
end
