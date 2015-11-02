BhlRails4::Application.routes.draw do
  scope "(:locale)", :locale => /en|ar/ do
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



    root :to => 'pages#home'
    get "users/activate/:guid/:activation_code" => "users#activate"
    get "user_search_history/save_query"    

    resources :books do
      collection do
        get 'autocomplete'
      end
    end

    resources :users do
      collection do
        get 'login'
        get 'forgot_password'
        post 'validate'
      end
      member do
        get 'logout'
        get 'get_user_profile_photo'
      end
    end


    resources :pages do
      collection do
        get 'about'
        get 'home'
        get 'contact'
        get 'top_rated_books'
        post 'send_contact_us_message'
      end
    end

    resources :activities do
      collection do
        get 'get_activity_log'
      end
    end

    resources :names

    resources :geographics

    resources :collections

    get "hadoop/pending_metadata"
    get "hadoop/ingest_metadata", to: 'hadoop#ingest_metadata'
  end
end
