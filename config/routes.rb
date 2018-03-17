Rails.application.routes.draw do
  get 'youreis/create'

  get 'youreis/destroy'

  devise_for :users
  root 'pages#index'

  resources :pages

  resources :words

  resources :youreis
end
