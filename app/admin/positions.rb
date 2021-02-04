ActiveAdmin.register Position do
  actions :all, :except => [:destroy, :edit, :new]   
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                Position.where(id: importer.values_at('id')).delete_all
                
              }
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :name
    column :box_id
    column :nb
    column (:box) {|position| position.box.name}
  end
                 
#Add Button to site
  action_item do
    link_to "View Site", "/"
  end
permit_params :id, :name, :box_id, :box_name, :shelf_id, :nb, :created_at

end
