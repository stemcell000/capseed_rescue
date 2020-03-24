ActiveAdmin.register QcAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :clone_batch_qc_id
    column :attachment
  end
end
