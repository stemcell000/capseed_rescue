ActiveAdmin.register PlasmidBox do
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                PlasmidBox.where(id: importer.values_at('id')).delete_all
                
              }
              
permit_params :id, :name, :barcode,:created_at

end
