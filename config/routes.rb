LearnRails::Application.routes.draw do
  get 'users/new'

  get 'signup/drop'

  get 'signup/new'

	resources :contacts, only: [:new, :create]
	resources :visitors, only: [:new, :create]
	resources :home, only: [:new]
	resources :signup, only: [:new]
	resources :about, only: [:new]
	root to: 'home#new'
end