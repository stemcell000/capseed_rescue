ActiveAdmin.register Origin do
#
index do
  column :id
  column :name
  column :created_at
  column :updated_at
  actions
 end

 #Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
             before_batch_import: ->(importer) {
              },
              batch_size: 1000 


permit_params :list, :of, :attributes, :on, :model, :id, :name

end
