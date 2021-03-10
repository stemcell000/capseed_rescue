ActiveAdmin.register Dosage do
#index columns
  index do
    column :id
    column :titer
    column :titer_atcc
    column :titer_to_atcc
    column :date
    column :virus_production_id
    column :comment
    column :inactivation
#actions
    actions defaults: false do |p|
    link_to "Edit", edit_admin_dosage_path(p)
  end
end

#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                Dosage.where(id: importer.values_at('id')).delete_all
              }

permit_params  :id, :titer, :titer_atcc, :titer_to_atcc, :virus_production_id, :user_id, :accepted


#FOR DATA ANALYSIS

  csv do
    column :id
    column :titer
    column :titer_atcc
    column :titer_to_atcc
    column :accepted
    column :virus_production_id
  end

csv do
  column :id
  column :titer
  column :titer_atcc
  column :titer_to_atcc
  column :accepted
  column :virus_production_id
end
end