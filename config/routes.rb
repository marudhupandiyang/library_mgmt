Library3::Application.routes.draw do



  devise_for :auths

  root :to => 'admin#index'
  
  resources :auths
  resources :users  
  resources :transcations
  resources :authors
  resources :categories
  resources :tags
  resources :books

  match '/search' => 'books#search' , :as => :search , :via => [:get , :post]

  match '/addbook/:id' => 'admin#addbook' , :as => :addbook , :via => [:get , :post]
  #match '/issue' => 'admin#issuebook' , :as => :issue  ,:via => [:get]
  match '/return/:id' => 'transcations#returnbook' , :as => :returnbook  ,:via => [:post]
  match '/reissue' => 'transcations#search' , :as => :reissuesearch  ,:via => [:get,:post]

  # get "tags/destroy"

  # get "tags/new"

  # get "tags/index"

  # get "tags/edit"

  # get "categories/destroy"

  # get "categories/new"

  # get "categories/index"

  # get "categories/edit"

  # get "author/destroy"

  # get "author/new"

  # get "author/index"

  # get "author/edit"




  # match '/show' => "admin#show" ,:as => :showbooks , :via => [:post]

  # match "/search" => "admin#index" , :as => :searchbooks, :via => [:get]


  # match "/addbooks" => 'admin#addbook' , :as => :addbooks , :via => [:post]

  # match '/addauthor' => 'admin#addAuthor' ,:as => :addauthor , :via => [:post ]

  # match '/newauthor' => 'admin#newAuthor' ,:as => :newauthor , :via => [:get ]

  # match '/deleteauthor/:id' => 'admin#destroyAuthor' ,:as => :deleteauthor , :via => [:get ]


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
