Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # ROOT
  root 'gossips#index'

  # PAGES STATIQUES
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'

  # GOSSIPS
  get 'gossips/show'
  get 'gossips/show/:id', to: 'gossips#show'
  get 'gossips/edit'
  get 'gossips/edit/:id', to: 'gossips#edit'
  get 'gossips/new' #TODO
  post 'gossips/new', to: 'gossips#new'#TODO

  # USERS 
  get 'users/welcome'
  get 'users/welcome/:first_name', to: 'users#welcome'




  

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
