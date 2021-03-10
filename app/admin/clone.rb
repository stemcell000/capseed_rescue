ActiveAdmin.register Clone do
  
  
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                Clone.where(id: importer.values_at('id')).delete_all
                
              }
              
              
end
