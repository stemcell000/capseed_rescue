ActiveAdmin.register Sequencing do
 #Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                
                Sequencing.where(id: importer.values_at('id')).delete_all
                          
              }
permit_params :list, :of, :attributes, :on, :model, :id, :name

#Add Button to site
action_item do
  link_to "View Site", "/"
end


end
