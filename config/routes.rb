Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get "user/:id" => "users#show"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  resources :items do
  end
end
