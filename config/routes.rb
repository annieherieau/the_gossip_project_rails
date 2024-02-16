Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # ROOT
  root 'gossips#index'

  # PAGES STATIQUES
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'

  # GOSSIPS CRUD
  resources :gossips do
    resources :comments, only: [:edit, :create, :update, :destroy]
    resources :likes, only: [:show, :create, :destroy]
  end

  # USERS 
  get 'users/welcome'
  get 'users/welcome/:id', to: 'users#welcome'
  resources :users

  # CITIES
  resources :cities

  # SESSIONS
  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/:id', to: 'sessions#destroy'
 

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
