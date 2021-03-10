ActiveAdmin.register Assay do

active_admin_import validate: true,
             csv_options: {col_sep: ";" }

 
permit_params :list, :of, :attributes, :on, :model, :id, :name, :display, :step, :last_step, :created_at, :row_order_position, :updated_at



end
