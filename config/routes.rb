Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  resources :users, except: [:show]

  root to: 'users#index'
end