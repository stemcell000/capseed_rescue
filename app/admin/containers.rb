ActiveAdmin.register Container do
permit_params :list, :of, :attributes, :on, :model, :id, :name, :barcode, :created_at, :updated_at

end
