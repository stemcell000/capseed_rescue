ActiveAdmin.register PlasmidBatchAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :plasmid_batch_id
    column :attachment
  end

 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                PlasmidBatchAttachment.where(id: importer.values_at('id')).delete_all
                
              }

end
