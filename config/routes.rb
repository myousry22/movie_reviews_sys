Rails.application.routes.draw do


  root to: 'movies#index'
  post 'imports/movie/csv', to: 'movies#import'
  resources :movies do
    resources :reviews
  end
end
