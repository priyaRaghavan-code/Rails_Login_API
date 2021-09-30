Rails.application.routes.draw do
  # resources :users, param: :_username
  resources :users
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :cart_items
      post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
      post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end