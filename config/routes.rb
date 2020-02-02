Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  # get '/users/:id', to: 'pages#show', as: 'users'
  resources :pages, only: :show, path: '/users' do
    resource :friend_requests, only: [:create, :destroy]
    get :requestings, on: :member
    get :requests, on: :member
  end
  resources :groups, except: :index do
    resources :posts
  end
end
