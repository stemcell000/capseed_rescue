ActiveAdmin.register VolUnit do
index do
  column :id
  column :name
  column :created_at
  column :updated_at

  actions
 end
 
permit_params :list, :of, :attributes, :on, :model, :id, :name, :created_at, :updated_at


end
