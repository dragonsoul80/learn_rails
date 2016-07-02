LearnRails::Application.routes.draw do
  get 'password_reset/new'

  get 'password_reset/edit'

  	get    'login' => 'sessions#new'
  	post   'login' => 'sessions#create'
  	delete 'logout' => 'sessions#destroy'
  	get    'signup'  => 'users#new'


  resources :contacts, only: [:new, :create]
	resources :visitors, only: [:new, :create]
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
	root to: 'static_pages#home'



end
