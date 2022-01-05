Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :products, only: [:show]
  resources :carts, only: [:index]
  post '/add_to_cart/:id', to: 'carts#add_to_cart'
  get '/products/remove_from_cart/:id', to: 'carts#remove_from_cart'
  namespace :admin do
    root to: "dashboard#index"
    resources :products, only: [:index, :create, :show, :update, :destroy]
    resources :category, only: [:index, :create, :show, :update, :destroy]
    resources :sessions, only: [:create, :destroy]
    resources :registers, only: [:create]

    get '/sign_in', to: 'sessions#new'
    get '/sign_up', to: 'registers#new'
    delete '/delete_multiple', to: 'products#delete_multiple'
  end
  namespace :api do
    get '/province', to: 'address_user#load_province'
    get '/district/:id', to: 'address_user#load_district_by_province_id'
    get '/ward/:id', to: 'address_user#load_ward'
    post '/update_user', to: 'users#edit_user'
    post '/update_quantity', to: 'carts#update_cart'
  end
end
