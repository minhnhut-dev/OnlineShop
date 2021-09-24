Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :products, only: [:show]
  resources :carts, only: [:index]
  post '/add_to_cart/:id', to: 'carts#add_to_cart'
  get '/products/remove_from_cart/:id', to: 'carts#remove_from_cart'
  namespace :admin do
    root to: "dashboard#index"
    resources :products, only: [:index, :create]
  end
end
