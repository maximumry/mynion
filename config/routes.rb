Rails.application.routes.draw do
  devise_for :users
  root to: 'opinions#index'
  resources :opinions, only: :index
end
