Rails.application.routes.draw do
  devise_for :users
  root to: 'mynions#index'
  resources :opinions, only: :index
end
