Rails.application.routes.draw do
  get 'sessions/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match '/auth/:provider/callback', :to => 'sessions#create', via: :get
  match '/auth/:provider/callback', :to => 'sessions#create', via: :get
	match '/signout', :to => 'sessions#destroy', :as => :signout, via: :get
	#match '/signin' => 'sessions#new', :as => :signin
end
