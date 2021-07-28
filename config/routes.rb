Rails.application.routes.draw do
  resources :reviews
  resources :locations
  resources :meals, only: [:new, :index, :create]
  resources :restaurants do 
    resources :meals, shallow: true
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
