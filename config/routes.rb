Rails.application.routes.draw do

  root to: "public#home"
  
  devise_for :users
  
  devise_scope :user do
    get 'login' => 'users/sessions#new', as: "login" # published url
    get 'logout' => 'users/sessions#destroy', as: "logout" # published url
  end
    
  namespace :admin do
    get 'dashboard' => 'dashboard#show'
    resources :jobs
    resources :users
    resources :customers
    resources :consumers
    resources :interpreters
  end
  
  get 'consumer/dash' => 'public#dashboard', as: :consumer_dash
  get 'interpreter/dash' => 'interpreter#dash', as: :interpreter_dash
  
end
