Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  devise_for :users
  root 'pages#show'
  resources :groups, except: :index do
    resources :posts
  end
end
