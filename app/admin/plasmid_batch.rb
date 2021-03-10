ActiveAdmin.register PlasmidBatch do
 #Strong parameters
 permit_params :list, :of, :attributes, :on, :model, :trash, :name, :volume, :concentration,
 :clone_batch_id, :unit_id, :format, :comment, :qc_validation, :strict_validation, :volume,
 :vol_unit_id, :row_id, :column_id, :format_id, :name, :number, :user_id, :box_id, :date, :trash,
 :barcode, :user_attributes => [:id, :username, :firstname, :lastname, :full_name]  
 config.filters = false
 #Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                
                PlasmidBatch.where(id: importer.values_at('id')).delete_all
                
                          
              }
  
end
