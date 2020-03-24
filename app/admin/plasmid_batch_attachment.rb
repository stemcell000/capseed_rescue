ActiveAdmin.register PlasmidBatchAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :plasmid_batch_id
    column :attachment
  end

end
