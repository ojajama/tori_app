Rails.application.routes.draw do

  get 'rooms/show'

  get 'youreis/create'

  get 'youreis/destroy'

  get '/words/q_search', to: 'words#q_search', as: 'word_search'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords     => "users/passwords"
  }

  root 'pages#index'

  resources :pages

  resources :words

  resources :youreis

  resources :rooms

  resources :groups

  resources :users, :only => [:show, :index]

  resources :terms, :only => [:create]

  resources :teams

end
