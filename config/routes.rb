Rails.application.routes.draw do

  root 'puzzle#index'

  resources :properties

end
