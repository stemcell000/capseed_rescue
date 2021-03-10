ActiveAdmin.register VirusBatch do
  
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              headers_rewrites: { 'box' => :box_id},
              before_batch_import: ->(importer) {
   
                VirusBatch.where(id: importer.values_at('id')).delete_all
              }
csv force_quotes: false, col_sep: ';', column_names: true do
  column :id
  column :name
  column :virus_production_id
  column :position_id
  column :date
  column :volume
  column :created_at
  column :updated_at
  column :comment
  column :vol_unit_id
  column :trash
  column :barcode
  column :date_of_thawing
  column :recap
end              

end
