ActiveAdmin.register PlasmidBatchQc do
  #Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
             before_batch_import: ->(importer) {
               
              }

end
