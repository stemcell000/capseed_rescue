ActiveAdmin.register Option do
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                Option.where(id: importer.values_at('id')).delete_all
              }

end
