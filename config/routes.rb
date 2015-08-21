Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products
  devise_for :customers

  root 'products#index'

end
