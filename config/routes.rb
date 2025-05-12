Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  
  devise_scope :user do
    get '/users/sign_in' => 'devise/sessions#new'
    post '/users/sign_in' => 'devise/sessions#create'
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, except: [:show]

  root to: 'users#index'
end