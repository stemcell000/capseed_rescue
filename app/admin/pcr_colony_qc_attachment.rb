ActiveAdmin.register PcrColonyQcAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :pcr_colony_id
    column :qc_attachment_id
  end

end
