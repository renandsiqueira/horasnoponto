Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "home#index"

  resources :range_times

  resources :users

  get 'sessions/create'

  match '/auth/:provider/callback', :to => 'sessions#create', via: :get
  match '/signout', :to => 'sessions#destroy', :as => :signout, via: :get
 
end
