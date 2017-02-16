Rails.application.routes.draw do
  get 'home/index'

  root "home#index"

  get 'sessions/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match '/auth/:provider/callback', :to => 'sessions#create', via: :get
  #match '/signin' => 'sessions#new', :as => :signin

  match '/auth/:provider/callback', :to => 'sessions#create', via: :get
  match '/signout', :to => 'sessions#destroy', :as => :signout, via: :get
  get 'current_user', :to => 'application#current_user'
  get 'signed_in', :to => 'pplication#signed_in'

  resources :users

end
