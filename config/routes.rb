Rails.application.routes.draw do

  root to: "public#home"

  get 'admin/dash' => 'public#dashboard', as: :admin_dash
  get 'consumer/dash' => 'public#dashboard', as: :consumer_dash
  get 'interpreter/dash' => 'interpreter#dash', as: :interpreter_dash
  
  devise_for :users
  
  resources :jobs
  resources :users
  resources :consumers
  resources :customers
  resources :interpreters
end
