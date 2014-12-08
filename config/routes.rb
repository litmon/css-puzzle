Rails.application.routes.draw do

  root 'puzzles#index'

  resources :properties

end
