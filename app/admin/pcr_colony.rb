ActiveAdmin.register PcrColony do

#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                PcrColony.where(id: importer.values_at('id')).delete_all
              }

permit_params :list, :of, :attributes, :on, :model, :id, :name


end
