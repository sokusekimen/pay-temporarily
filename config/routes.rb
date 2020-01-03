Rails.application.routes.draw do
  devise_for :users
  root 'pages#show'
  resources :groups, expect: [:index]
end
