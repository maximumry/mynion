Rails.application.routes.draw do
  devise_for :users
  root to: 'opinions#index'
  resources :opinions, only: [:index, :new, :create, :show] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
