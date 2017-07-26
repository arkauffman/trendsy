Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#home'
  get 'checkout', to: 'users#checkout'
  get 'profile/:id', to: 'users#profile', as: :profile
  get 'manage', to: 'users#manage'
  delete 'users/:id', to: 'users#destroy', as: :destroy
  get 'home', to: 'products#home', as: :home
  
  resources :users
  resources :products do
    resources :line_items, shallow: true
  end
  resources :orders

  get 'upload/:id', to: 'products#upload', as: :upload
  
  get 'sessions', to: 'sessions#index'
  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:get, :new, :create, :destroy]

  get 'login', to: 'sessions#new'

end
