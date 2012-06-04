Events::Application.routes.draw do



  get "rsvps/create"

  get "rsvps/new"

  get "rsvps/edit"

  get "rsvps/show"

  mount RailsAdmin::Engine => '/gc_admin', :as => 'rails_admin'

  devise_for :users
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  match 'myaccount' => 'events#myaccount'
  match 'active_event' => 'events#active_event' 
  match 'past_event' => 'events#past_event' 
  match 'profile/:id' => 'events#profile' , :as => 'profile', :via => :get
  #map.connect "profile/:username", :controller => "events", :action => "profile"
  # get  'events/profile', :as => 'profile'
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
  #match 'contact' => 'events#contact'
  resources :venues
  
    resources :events   do
     # get :autocomplete_venue_name, :on => :collection
     # get "complete"
    resources :locations, :only => [:new, :create]
    resources :rsvps, :only => [:create]
  end
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'events#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
