ActiveAdmin.register Box do
actions :all, :except => [:destroy, :edit]   
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                Box.where(id: importer.values_at('id')).delete_all
                
              }
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :name
    column :barcode
    column :box_type_id
    column :shelf_id
  end
              
              
#Add Button to site
action_item do
  link_to "View Site", "/"
end
permit_params :id, :name, :barcode, :created_at
end
