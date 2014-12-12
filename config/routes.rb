require 'resque/server'

Rails.application.routes.draw do
  resources :calendars


  mount Resque::Server, :at => "/resque"

  root 'home#index'
  get  'auth/twitter/callback',       to: 'sessions#create'
  get  'signout',                     to: 'sessions#destroy',     as: :signout

  # users
  get   '/profile',                   to: 'users#show',           as: :profile
  get   '/admin',                     to: 'users#admin',          as: :admin
  patch '/admin/yes',                 to: 'users#make_admin'

  # news
  get   '/news',                      to: 'posts#posts',          as: :news
  post  '/news/post',                 to: 'posts#create',         as: :create_news
  get   '/news/create',               to: 'posts#new',            as: :post_news
  get   '/news/edit/:title',          to: 'posts#edit',           as: :edit_news
  patch '/news/update',               to: 'post#updated',         as: :updated_news
  get   '/news/:title',               to: 'posts#post',           as: :post

  # events
  # get '/calendar',                    to: 'calendars#index',      as: :calendar

  # tools
  get 'tools/',                     to: 'tools#index',          as: :tools
  get 'tools/manage',               to: 'tools#manage',         as: :manage_tools
  post 'tools/add',                 to: 'tools#create',         as: :add_tool
  delete 'tools/remove',            to: 'tools#destroy',        as: :remove_tool
  post 'tools/checkout',            to: 'tools#check_out',      as: :check_out
  post 'tools/checkin',             to: 'tools#check_in',       as: :check_in

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
