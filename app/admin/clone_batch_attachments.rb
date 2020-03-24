ActiveAdmin.register CloneBatchAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :clone_batch_id
    column :attachment
  end
end
