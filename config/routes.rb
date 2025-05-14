Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  
  devise_scope :user do
    get '/users/sign_in' => 'devise/sessions#new'
    post '/users/sign_in' => 'devise/sessions#create'
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'

  resources :users, except: [:show]
  
  scope '/cadastros' do
    resources :responsaveis
    resources :alunos
    resources :professores
    resources :turmas do
      resources :matriculas, only: [:new, :create, :destroy]
    end
  end
end
