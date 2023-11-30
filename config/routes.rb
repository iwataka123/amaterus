Rails.application.routes.draw do
  devise_for :users
  # , controllers:{
  #   registrations: "users/registrations"
  # }
  root to: 'articles#index'
  resources :articles

  # get 'rooms/show' => 'rooms#show'
  get 'checks/:id', to: 'checks#check', as: 'check'
end