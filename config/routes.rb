Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'
  root to: 'movies#index'
  post 'imports/movie/csv', to: 'movies#import'
  post 'imports/review/csv', to: 'reviews#import'
  resources :movies do
    resources :reviews
  end
end
