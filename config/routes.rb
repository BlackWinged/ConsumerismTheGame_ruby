Rails.application.routes.draw do

  get 'users/test'
  resources :users
  get 'public/index'
  post 'public/contact'


  get 'splash/index'
  get 'splash/portfolio'

  root 'public#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
