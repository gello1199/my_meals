Rails.application.routes.draw do
  root to: 'sessions#welcome'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/restaurants/reverse_order', to: 'restaurants#reverse_order'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :locations
  resources :meals, only: [:index, :show]
  resources :restaurants do 
    resources :meals, except: [:index]
  end
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
