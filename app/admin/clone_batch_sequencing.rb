ActiveAdmin.register CloneBatchSequencing do
  #Import csv   
 active_admin_import validate: true,
             csv_options: {col_sep: ";" },
             before_batch_import: ->(importer) {
               
               CloneBatchPromoter.where(id: importer.values_at('id')).delete_all

              }

end
