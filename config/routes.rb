LearnRails::Application.routes.draw do
  	resources :contacts, only: [:new, :create]
	resources :visitors, only: [:new, :create]
	resources :users
	resources :about, only: [:new]
	root to: 'users#new'

	
end