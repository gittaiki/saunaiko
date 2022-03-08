Rails.application.routes.draw do
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  post 'callback', to: 'line_bots#callback'
  resources :videos, only: %i[index show] do
    get 'bookmarks', on: :collection
  end
  resources :users, only: %i[new create]
  resources :watches, only: %i[create destroy]
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show]
end
