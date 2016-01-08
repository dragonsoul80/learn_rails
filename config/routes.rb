LearnRails::Application.routes.draw do
	resources :contacts, only: [:new, :create]
	resources :visitors, only: [:new, :create]
	resources :about, only: [:new]
	root to: 'visitors#new'
end