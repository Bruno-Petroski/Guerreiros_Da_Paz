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
    resources :responsaveis, as: :responsavel
    resources :alunos do
      collection do
        get :search_responsaveis
      end
    end
    resources :professores, as: :professor
    resources :turmas do
      resources :matriculas, only: [:new, :create, :destroy]
    end
  end

  get 'alocacoes', to: 'alocacoes#index'
  post 'alocacoes/alocar', to: 'alocacoes#alocar', as: :alocar_alunos
  post 'alocacoes/remover', to: 'alocacoes#remover', as: :remover_alunos
end
