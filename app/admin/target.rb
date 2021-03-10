ActiveAdmin.register Target do
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
             Target.where(id: importer.values_at('id')).delete_all
              },
              batch_size: 1000 

end
