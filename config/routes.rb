Rails.application.routes.draw do

  get '/home/about' => 'homes#about'
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  patch 'books/:id' => 'books#update', as: 'update_book'
  resources :books do
    resource :favorites
    resources :book_comments
  end

  resources :users, only: [:index, :show, :edit, :update]
end
