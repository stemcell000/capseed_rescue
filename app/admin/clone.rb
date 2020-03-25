ActiveAdmin.register Clone do
 #Add Button to site
action_item do
   link_to "View Site", "/"
end 
  
  
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                Clone.where(id: importer.values_at('id')).delete_all
                
              }
              
              
end
