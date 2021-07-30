Rails.application.routes.draw do
  root to: 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :reviews
  resources :locations
  resources :meals, only: [:new, :index, :create, :show]
  resources :restaurants do 
    resources :meals, only: [:new, :index, :create, :show]
  end
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
