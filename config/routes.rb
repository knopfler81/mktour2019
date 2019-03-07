Rails.application.routes.draw do
 devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'concerts#index'


  resources :users, only: :show

  resources :concerts do
		resources :comments
	  member do
	    put 'register'
	    put 'unsubscribe'
	  end
	end	

end