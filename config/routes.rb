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
      root to: 'welcome#index', as: :unauthenticated_root
    end
  end

  resources :puzzles

end
