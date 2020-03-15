Rails.application.routes.draw do
  resources :option_virus_productions
  resources :vol_units
  resources :virus_productions
  resources :virus_batches
  resources :units
  resources :types
  resources :targets
  resources :strands
  resources :sterilitytests
  resources :statistics
  resources :sequencings
  resources :rows
  resources :qc_attachment_sequencings
  resources :qc_attachments
  resources :promoters
  resources :production_projects
  resources :productions
  resources :primers
  resources :plasmid_batch_productions
  resources :plasmid_batches
  resources :plasmid_batch_qc_attachements
  resources :plasmid_batch_qc_batches
  resources :plasmid_batch_qcs
  resources :plasmid_batch_attachments
  resources :pcr_colony_qc_attachments
  resources :pcr_colonies
  resources :origins
  resources :options
  resources :inserts
  resources :genes
  resources :formats
  resources :dosages
  resources :columns
  resources :cmeths
  resources :clone_projects
  resources :clone_inserts
  resources :clone_enzymes
  resources :clone_batch_users
  resources :clone_batch_sequencings
  resources :clone_batch_promoters
  resources :clone_batch_productions
  resources :clone_batch_pcr_colonies
  resources :clone_batch_options
  resources :clone_batch_genes
  resources :clone_batches
  resources :clone_batch_attachments
  resources :clone_batch_as_plasmid_attachments
  resources :clone_attachments
  resources :boxes
  resources :assay_projects
  devise_for :admin_users
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users
  resources :enzymes
  resources :projects
  resources :clones
  resources :assays
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
