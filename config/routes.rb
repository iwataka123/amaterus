Rails.application.routes.draw do
  get 'schedules/index'
  devise_for :users, controllers:{
    registrations: "users/registrations"
  }
  root to: 'articles#index'
  resources :articles
  resources :schedules
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end

  get 'checks/:id', to: 'checks#check', as: 'check'
end