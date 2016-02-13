LearnRails::Application.routes.draw do
  get 'users/new'

  	resources :contacts, only: [:new, :create]
	resources :visitors, only: [:new, :create]
	resources :users
	resources :about, only: [:new]
	root to: 'users#new'

	
end