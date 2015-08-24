Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :products, only: [:show, :index]
  resource :carts, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :customers

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  root 'products#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  post '/add_to_cart/:product_id' => 'carts#show', :as => 'add_to_cart'

end
