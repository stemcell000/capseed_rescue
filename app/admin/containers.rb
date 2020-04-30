ActiveAdmin.register Container do
permit_params :list, :of, :attributes, :on, :model, :id, :name, :barcode, :created_at, :updated_at,
shelves_attributes: [:id, :name, :barcode, :_destroy]

  form title: 'Container' do |f|
      f.semantic_errors
      f.inputs 'Details' do 
        f.input :name
        f.input :barcode
      end
      f.inputs do
        f.has_many :shelves, heading: 'Shelves', allow_destroy: true, new_record: true do |a|
          a.input :name
          a.input :barcode
        end
      f.actions 
    end 
  end
  
  show do
    h4 "Container's barcode :"+ container.barcode
    
    h4 "Shelves :"
      container.shelves.each do |s|
        div "Name :"+ s.name
        unless s.barcode ==""
          div "Barcode :"+ s.barcode
        end
      end
  end
end
