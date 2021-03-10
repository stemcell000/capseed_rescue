ActiveAdmin.register Gene do
 
  index do
    column :id
    column :name
    column :clone_batch
   end

  
##Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
             before_batch_import: ->(importer) {
               
               

              } 


permit_params :list, :of, :attributes, :on, :model, :id, :name, :clone_batch_id

end
