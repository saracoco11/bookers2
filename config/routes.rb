Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  resources :books
  post '/books/:id', to: 'books#show'
  resources :users, only: [:index, :show, :edit, :update]
end
