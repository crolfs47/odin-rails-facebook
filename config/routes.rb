Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'posts#index'
  resources :posts do
    resources :likes, only: %i[new create destroy]
  end

  resources :users, only: %i[index show edit update] do
    resources :friendships
  end

  resources :notifications, only: %i[index mark_as_read] do
    collection do
      patch :mark_as_read, path: 'mark_as_read_notifications/:id'
    end
  end

  # get 'friendships', to: 'friendships#index'
end
