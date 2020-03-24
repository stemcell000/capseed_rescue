ActiveAdmin.register QcAttachmentSequencing do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :qc_attachment_id
    column :sequencing_id
  end

end
