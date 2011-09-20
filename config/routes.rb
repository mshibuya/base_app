BaseApp::Application.routes.draw do
=begin
  ## for module-based routing
  constraints(:subdomain => /^(www)?$/) do
    resources :image_tests
  end
  scope :module => 'mobile', :as => 'mobile', :constraints => {:subdomain => 'm'} do
    resources :image_tests
  end
  root :to => "image_tests#index"
=end
  resources :image_tests
  root :to => "image_tests#index"

  devise_for :admins

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  scope "admin", :module => :rails_admin, :as => "rails_admin" do
    controller "user", :as => 'user' do
      post "/:model_name/reorder", :to => :reorder, :as => "reorder"
    end
  end
end
