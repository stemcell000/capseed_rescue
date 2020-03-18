ActiveAdmin.register CloneEnzyme do
#Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
             before_batch_import: ->(importer) {
               
               

              }

permit_params :list, :of, :attributes, :on, :model, :id, :name, :clone_id, :enzyme_id
end
