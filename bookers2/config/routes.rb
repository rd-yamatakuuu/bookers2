Rails.application.routes.draw do

  get 'search/search'
  get 'users/show'
  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
   }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'books#top'

  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    #resource :otherfavorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  #resources :relationships, only: [:create, :destroy]
  post 'relationships/:id' => 'relationships#create', as: 'follow'
  get 'relationships/follower' => 'relationships#index', as: 'follower'
  get 'relationships/followed' => 'relationships#index2', as: 'followed'
  delete 'relationships/:id' => 'relationships#destroy', as: 'unfollow'

  get 'home/about' => 'homes#about'
  get '/search' => 'search#search'



end
