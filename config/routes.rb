Rails.application.routes.draw do

  root to: "public#home"

  devise_for :users
  
  resources :jobs
  resources :users
  resources :consumers
  resources :customers
  resources :interpreters
end
