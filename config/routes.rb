Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: :show

  resources :teams, only: %i[index show edit update]

  resources :driver, only: %i[index show edit update]

  resources :cars, only: %i[index show update]

  resources :chiefs, only: %i[index show edit update]

  resources :circuits, only: %i[index]

  resources :races

  # Route for the qualifying method inside races controller
  put 'races/:id/qualy', to: 'races#qualy', as: 'qualy_race'
end
