Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
    member do
      get :followings
    end
  end

  resources :items, only: [:show, :new]
  resources :ownerships, only: [:create, :destroy]
  
  resources :mypages, only: [:show, :new, :create]

  get 'registitem', to: 'mypages#new'
  post 'registitem', to: 'mypages#create'
  
  resources :myitems, only: [:show]

  resources :microposts, only: [:show, :create, :destroy]
  resources :communities, only: [:show, :new, :create]
  resources :relationships, only: [:create, :destroy]
end
