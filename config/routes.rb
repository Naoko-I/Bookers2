Rails.application.routes.draw do
  root 'home#top'
  # ↑の解説。大事！！get '/' => 'home#top'
  get 'home/about' => 'home#about'
  resources :books
  # get 'books/:id' => 'books#show'
  # get 'books/new' => 'books#new'
  # get 'books/:id/edit' => 'books#edit'
  # put 'books/:id' => 'books#update'
  # get 'books/' =>'books#index'
  # post 'books/' => 'books#create'
  # delete 'books/:id' => 'books#delete'
  devise_for :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
