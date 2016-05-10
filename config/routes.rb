LearnRails::Application.routes.draw do
  	get    'login' => 'sessions#new'
  	post   'login' => 'sessions#create'
  	delete 'logout' => 'sessions#destroy'
  	get    'signup'  => 'users#new'


  resources :contacts, only: [:new, :create]
	resources :visitors, only: [:new, :create]
  resources :users
  resources :account_activations, only: [:edit]
	root to: 'static_pages#home'



end
