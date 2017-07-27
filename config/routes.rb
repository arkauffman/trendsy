Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#home'
  get 'profile/:id', to: 'users#profile', as: :profile
  get 'manage', to: 'users#manage'
  get 'profile/:id/edit', to: 'users#edit', as: :edit
  get 'home', to: 'products#home', as: :home
  patch 'products/:id/active', to: 'products#activate', as: :activate
  
  resources :users
  resources :products do
    resources :line_items, shallow: true
  end
  resources :orders

  patch 'orders/:id/checkout', to: 'orders#checkout', as: :checkout
  get 'upload/:id', to: 'products#upload', as: :upload
  get 'sessions', to: 'sessions#index'
  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:get, :new, :create, :destroy]
  get 'login', to: 'sessions#new'
end
