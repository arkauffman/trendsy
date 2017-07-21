Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  get 'checkout', to: 'users#checkout'
  get 'profile/:id', to: 'users#profile', as: :profile
  get 'upload/:id', to: 'users#upload', as: :upload
  get 'manage', to: 'users#manage'
  delete 'users/:id', to: 'users#destroy', as: :destroy
  resources :users
  
  get 'sessions', to: 'sessions#index'
  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:get, :new, :create, :destroy]

  get 'login', to: 'sessions#new'

end
