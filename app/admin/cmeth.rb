ActiveAdmin.register Cmeth do
#Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
             before_batch_import: ->(importer) {
             Cmeth.where(id: importer.values_at('id')).delete_all  
               

              }
permit_params :name
end
