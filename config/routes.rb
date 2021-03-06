Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end
  root 'users#index'
  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:create, :destroy, :update]
  resources :posts
  resources :likes, only: [:create, :destroy, :update]
  resources :comments, only: [:create, :destroy, :update]
  
end
