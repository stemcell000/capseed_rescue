ActiveAdmin.register Statistic do
    #Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                
                #Statistic.where(id: importer.values_at('id')).delete_all
                
              } 
  
  index do
  column :id
  column :value
  column :label
  actions
 end
    
end

