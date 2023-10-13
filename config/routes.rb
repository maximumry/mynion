Rails.application.routes.draw do
  root to: 'mynions#index'
  resources :mynions, only: :index
end
