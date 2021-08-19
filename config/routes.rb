Rails.application.routes.draw do
  root to: "static#home"
  namespace :v1 do
    resources :sessions, only:[:create]
  end

  namespace :v1 do
    resources :registrations, only:[:create]
  end
  namespace :v1 do
        match 'sessions/logout' => "sessions#logout",:via => :delete
        match 'sessions/logged_in' => 'sessions#logged_in', :via => :get
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
