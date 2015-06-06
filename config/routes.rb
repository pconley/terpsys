Rails.application.routes.draw do

  root to: "public/pages#home"
  
  devise_for :users
  
  devise_scope :user do
    get 'login'  => 'users/sessions#new',     as: "login"  # published url
    get 'logout' => 'users/sessions#destroy', as: "logout" # published url
  end
    
  namespace :public do
    get 'home' => 'pages#home'
    get 'dash' => 'pages#dashboard'
  end
  
  namespace :admin do
    get 'dashboard' => 'dashboard#show'
    resources :jobs
    resources :users
    resources :customers
    resources :consumers
    resources :interpreters
  end
  
  namespace :customer do
    get 'dashboard' => 'dashboard#show'
    resources :jobs
  end
  
  namespace :consumer do
    get 'dashboard' => 'dashboard#show'
    resources :jobs
  end
  
  namespace :interpreter do
    get 'dashboard' => 'dashboard#show'
    resources :jobs
  end
  
end
