ActiveAdmin.register VirusProduction do
 csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :production_id
    column :user_id
    column :vol_unit_id
    column :vol
    column :comment
    column :gel_prot
    column :invoice
    column :hek_result
    column :animal
    column :created_at
    column :updated_at
    column :date_of_production
    column :number
    column :plasmid_tag
    column :plasmid_batch_tag
    column :rev_plasmid_tag
    column :rev_plasmid_batch_tag
    column :nb
    column :genes_tag
    column :promoters_tag
    #column :recap
    column :dismissed
end    
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
           VirusProduction.where(id: importer.values_at('id')).delete_all
              },
              batch_size: 1000
              
#Add Button to site
action_item do
  link_to "View Site", "/"
end

permit_params :vol_unit, :number, :nb, :plate_id, :vol, :sterility, :plate_id, :titer, :titer_atcc, :titer_to_atcc, :comment,
:gel_prot, :invoice, :hek_result, :target, :animal, :user_id, :date_of_production

#FOR DATA ANALYSIS 
  csv do
    column :id
    column :nb
    column :number
    column :vol_unit
    column :vol
    column :sterility
    column :comment
    column :gel_prot
    column :invoice
    column :l2
    column :hek_result
    column :target
    column :animal
    column :production_id
    column :plasmid_tag
    column :plasmid_batch_tag
    column :rev_plasmid_tag
    column :rev_plasmid_batch_tag
  end
end

