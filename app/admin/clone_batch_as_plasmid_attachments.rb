ActiveAdmin.register CloneBatchAsPlasmidAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :clone_batch_id
    column :attachment
  end
  
 #Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
                CloneBatchAsPlasmidAttachment.where(id: importer.values_at('id')).delete_all
                
              }

end
