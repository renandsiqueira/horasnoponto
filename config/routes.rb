Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "home#index"

  resources :users

  resources :range_times

  resources :range_times_today

  resources :range_times_week

  resources :range_times_month

  get 'sessions/create'

  match '/auth/:provider/callback', :to => 'sessions#create', via: :get
  match '/signout', :to => 'sessions#destroy', :as => :signout, via: :get
 
end
