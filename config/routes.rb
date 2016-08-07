Jessicabao::Application.routes.draw do

  resources :settings

  resources :resumes

  mount Ckeditor::Engine => '/ckeditor'
  root to: "projects#landing"

  resources :arts
  resources :projects
  resources :github

  post "projects_sort" => 'projects#sort'
  get "githubimg" => "githubimg#index", format: :svg


  get "/admin/projects" => "projects#index"


  devise_for :users

  scope :api do
    get "/projects(.:format)" => "projects#index", :defaults=>{:format=> 'js'}
    get "/projects/:id(.:format)" => "projects#show", :defaults=>{:format=> 'js'}
    post "/projects/:id(.:format)/vote" => 'projects#vote', :defaults=>{:format=> 'json'}

    get "/arts(.:format)" => "arts#index", :defaults=>{:format=> 'js'}
    get "/arts/:id(.:format)" => "arts#show", :defaults=>{:format=> 'js'}
    post "/arts/:id(.:format)/vote" => 'arts#vote', :defaults=>{:format=> 'json'}

    get "/github" => "github#index", :defaults=> {:format =>  'js'}

  end
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
