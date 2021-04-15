Rails.application.routes.draw do

  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'books#top'

  resources :books, only: [:new, :create, :edit, :index, :show, :destroy]

  resources :users, only: [:show, :edit, :index, :create, :update]


end
