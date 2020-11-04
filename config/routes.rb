Rails.application.routes.draw do
  get 'purchase_histories/index'
  devise_for :users
  root to: "items#index"
  resources :items
end
