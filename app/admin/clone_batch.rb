ActiveAdmin.register CloneBatch do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :target_id
    column :name
    column :temp_name
    column :comment
    column :qc_validation
    column :strict_validation
    column :plasmid_validation
    column :date_as_plasmid
    column :glyc_stock_box_as_plasmid
    column :comment_as_plasmid
    column :created_at
    column :updated_at
    column :type_id
    column :clone_id
    column :number
    column :strand_id
    column :origin_id
    column :inventory_validation
    column :nb
    column :dismissed
    column :plasmid_batches_count
  end


 
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
              CloneBatch.where(id: importer.values_at('id')).delete_all
              }

permit_params :list, :of, :attributes, :on, :model, :id, :name, :strand_id, :temp_name, :comment, :qc_validation, :strict_validation, :plasmid_validation,
:date_as_plasmid, :glyc_stock_box_as_plasmid, :origin, :origin_id, :type_id, :type, :strand, :target, :target_id, :comment_as_plasmid, :promoters,
:genes, :created_at, :updated_at, :clone_id, :number, :dismissed, :nb

#Add Button to site
action_item do
  link_to "View Site", "/"
end

  
 index do
    column :id
    column :nb
    column :number
    column :name
    column :temp_name
    column :comment
    column :gel_prot
    column :strand
    column :dismissed
   #actions
    actions defaults: false do |p|
      link_to "Edit", edit_admin_clone_batch_path(p)
    end
end 

end
