## TODO
## Set routes for clients

Rails.application.routes.draw do
  resources :users, except: [:new, :edit]
  api_version(:module => "V1", :path => {:value => "v1"}, :default => true) do

    get 'users/index' => 'users#index'
    get 'users/:id/candidates' => 'users#candidates'
    get 'users/:id/elections' => 'users#elections'
    get 'users/:id/issues' => 'users#issues'
    get 'users/:id/clients' => 'users#clients'

    resources :candidates, only: [:show], :constraints => {:format => /(json)/ }
    resources :elections, only: [:show], :constraints => {:format => /(json)/ }
    resources :issues, only: [:show], :constraints => {:format => /(json)/ }
    resources :users, except: [:destroy], :constraints => {:format => /(json)/ }
    resources :clients, only: [:show], :constraints => {:format => /(json)/ }

  end

  # resources :categories, :only => [:show], :constraints => {:format => /(json|xml)/}

  # resources :users, except: [:new, :edit]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # get 'user/:id' => 'users#show'
  # get 'user' => 'users#show'
  # get 'users/:id' => 'user#show', as: :id
  # get '/users/:id/all' => 'users#all'
  # get 'users/:id' => 'users#show'

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
