require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  mount Sidekiq::Web => '/sidekiq'
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
