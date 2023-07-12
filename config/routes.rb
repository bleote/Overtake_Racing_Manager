Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/unprocessable_entity'
  get 'errors/internal_server_error'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: :show

  resources :teams, only: %i[index show edit update]

  resources :driver, only: %i[index show edit update]

  resources :cars, only: %i[index show update]

  resources :chiefs, only: %i[index show edit update]

  resources :circuits, only: %i[index]

  resources :races do
    member do
      get 'qualifying'
      get 'gp'
      get 'results'
    end
  end

  post 'races/update_lap_number', to: 'races#update_lap_number', as: 'update_lap_number'

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
