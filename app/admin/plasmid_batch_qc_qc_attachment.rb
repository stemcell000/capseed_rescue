ActiveAdmin.register PlasmidBatchQcQcAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :plasmid_batch_qc_id
    column :qc_attachment_id
  end

end
