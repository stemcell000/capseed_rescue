ActiveAdmin.register QcAttachmentSequencing do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :qc_attachment_id
    column :sequencing_id
  end
 
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                QcAttachmentSequencing.where(id: importer.values_at('id')).delete_all
                
              }

end
