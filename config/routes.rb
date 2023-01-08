Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'cats#index'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :cats, except: [:destroy] do
    resources :cat_rental_requests, only: [:new]
  end
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post 'approve'
      post 'deny'
    end
  end
  delete "/sessions.:session_id", to: "sessions#destroy_remote"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  
end
