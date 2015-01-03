# == Route Map
#
#                   Prefix Verb     URI Pattern                            Controller#Action
#         new_user_session GET      /users/sign_in(.:format)               users/sessions#new
#             user_session POST     /users/sign_in(.:format)               users/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)              users/sessions#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)        users/authentications#passthru {:provider=>/twitter|facebook|github/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format) users/authentications#(?-mix:twitter|facebook|github)
#            user_password POST     /users/password(.:format)              users/passwords#create
#        new_user_password GET      /users/password/new(.:format)          users/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)         users/passwords#edit
#                          PATCH    /users/password(.:format)              users/passwords#update
#                          PUT      /users/password(.:format)              users/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                users/registrations#cancel
#        user_registration POST     /users(.:format)                       users/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)               users/registrations#new
#   edit_user_registration GET      /users/edit(.:format)                  users/registrations#edit
#                          PATCH    /users(.:format)                       users/registrations#update
#                          PUT      /users(.:format)                       users/registrations#update
#                          DELETE   /users(.:format)                       users/registrations#destroy
#       authenticated_root GET      /                                      home#index
#     unauthenticated_root GET      /                                      welcome#index
#                  puzzles GET      /puzzles(.:format)                     puzzles#index
#                          POST     /puzzles(.:format)                     puzzles#create
#               new_puzzle GET      /puzzles/new(.:format)                 puzzles#new
#              edit_puzzle GET      /puzzles/:id/edit(.:format)            puzzles#edit
#                   puzzle GET      /puzzles/:id(.:format)                 puzzles#show
#                          PATCH    /puzzles/:id(.:format)                 puzzles#update
#                          PUT      /puzzles/:id(.:format)                 puzzles#update
#                          DELETE   /puzzles/:id(.:format)                 puzzles#destroy
#

Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/authentications'
  }

  devise_scope :users do
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'home#welcome', as: :unauthenticated_root
    end
  end

  resources :puzzles

end
