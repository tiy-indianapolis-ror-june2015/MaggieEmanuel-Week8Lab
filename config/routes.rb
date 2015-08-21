Rails.application.routes.draw do
  resources :products
  devise_for :customers

  root 'products#index'

end
