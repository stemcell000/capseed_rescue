ActiveAdmin.register QcAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :clone_batch_qc_id
    column :attachment
  end
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                QcAttachment.where(id: importer.values_at('id')).delete_all
                
              }
end
