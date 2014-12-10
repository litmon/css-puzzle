Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/authentications'
  }

  root 'puzzles#index'

  resources :puzzles
  resources :properties

end
