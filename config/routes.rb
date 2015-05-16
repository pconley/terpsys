Rails.application.routes.draw do

  resources :companies
  devise_for :users
  root to: "public#home"
  resources :users

end
