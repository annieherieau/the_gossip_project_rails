Rails.application.routes.draw do
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'team', to: 'application#team'

  get 'gossips/new'
  get 'gossips/edit'
  get 'gossips/show'
  

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'gossips#index'
end
