ActiveAdmin.register Insert do
index do
  column :id
  column :name
  column :number
  column :created_at
  column :updated_at
  column :dismissed
  actions
 end
 
  #Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
             before_batch_import: ->(importer) {
               
               Insert.where(id: importer.values_at('id')).delete_all

              },
              batch_size: 1000 

end
