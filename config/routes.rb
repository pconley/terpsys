Rails.application.routes.draw do

  root to: "public#home"

  devise_for :users
  
  resources :users
  resources :consumers
  resources :companies
  resources :interpreters
  
end
