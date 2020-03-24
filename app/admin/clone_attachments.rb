ActiveAdmin.register CloneAttachment do
csv force_quotes: false, col_sep: ';', column_names: true do
    column :id
    column :clone_id
    column :attachment
  end
end
