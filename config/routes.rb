Rails.application.routes.draw do

  devise_for :users
  root to: "furimas#index"
  resources :furimas, only: :index
  resources :items,   only: [:new, :create]
end
