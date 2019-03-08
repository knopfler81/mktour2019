Rails.application.routes.draw do
 devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'concerts#index'

  get "/home", to: "pages#home"
  get "/landing", to: "pages#landing"
  
  resources :users, only: [:show, :index]

  resources :concerts do
		resources :comments
	  member do
	    put 'register'
	    put 'unsubscribe'
	  end
	end	

end