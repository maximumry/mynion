Rails.application.routes.draw do
  devise_for :users
  root to: 'opinions#index'
  resources :opinions, only: [:index, :new, :create, :show] do
    resources :comments, only: :create
  end
end
