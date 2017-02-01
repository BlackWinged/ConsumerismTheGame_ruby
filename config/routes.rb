Rails.application.routes.draw do
  post 'bet_anals/betData'
  match "*all" => "bet_anals#cors_preflight_check", via: [:options] ,:constraints => { :method => "OPTIONS" }
#  resources :bet_anals
  resources :products
  resources :economic_objects
  resources :users
  get 'public/index'

  get 'splash/index'
  get 'splash/portfolio'

  root 'public#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
