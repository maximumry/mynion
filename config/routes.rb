Rails.application.routes.draw do
  root to: 'mynions#index'
  resources :opinions, only: [:index, :new, :create]
end
