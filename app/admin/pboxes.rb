ActiveAdmin.register Pbox do
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                Pbox.where(id: importer.values_at('id')).delete_all
                
              }
              
#Add Button to site
action_item do
  link_to "View Site", "/"
end
permit_params :id, :name, :barcode,:created_at

end
