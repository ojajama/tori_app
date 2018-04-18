Rails.application.routes.draw do
  get 'youreis/create'

  get 'youreis/destroy'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords     => "users/passwords"
  }

  root 'pages#index'

  resources :pages

  resources :words

  resources :youreis

end
