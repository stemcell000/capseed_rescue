ActiveAdmin.register PlasmidBatchProduction do
#Import csv   
 active_admin_import validate: false,
              csv_options: {col_sep: ";" },
              before_batch_import: ->(importer) {
              PlasmidBatchProduction.where(id: importer.values_at('id')).delete_all
              },
              batch_size: 1000

#

csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :production_id
    column :plasmid_batch_id
    column :volume
    column :starting_volume
end
#

permit_params :list, :of, :attributes, :on, :model, :volume, :starting_volume

end
