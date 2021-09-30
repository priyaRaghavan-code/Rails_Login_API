Rails.application.routes.draw do
  # resources :users, param: :_username
  resources :users
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'
  resources :products
  resources :categories, only: [:index] do
    resources :products, only: [:index] do
    end
  end
  get '/cart', to: "order_items#index"
  resources :order_items, path: '/cart/items'
  get '/cart/checkout', to:'orders#new', as: :checkout
  patch '/cart/checkout', to:'orders#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
