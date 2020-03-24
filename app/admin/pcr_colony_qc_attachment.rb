ActiveAdmin.register PcrColonyQcAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :pcr_colony_id
    column :qc_attachment_id
  end
  
  
 #Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                PcrColonyQcAttachment.where(id: importer.values_at('id')).delete_all
                
              }

end
