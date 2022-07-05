Rails.application.routes.draw do
  get 'reservations/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, except: :destroy do
    resources :favorites, only: [:create, :destroy]
    resources :reservations, only: [:create, :update, :destroy, :show]
    resources :ratings, only: [:create]
  end
end
