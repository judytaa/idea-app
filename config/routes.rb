Rails.application.routes.draw do
  root to: 'ideas#index'
  devise_for :users
  resources :ideas do
    resources :comments
    resource :likes, controller: 'ideas/likes'
  end
end
