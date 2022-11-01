Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    resources :golfers, only: %i[index new create edit update]
    resources :posts, only: :index
    resources :favors, only: :index
  end
  post 'favor/:id' => 'favors#create', as: 'create_favor'
  delete 'favor/:id' => 'favors#destroy', as: 'destroy_favor'
  get 'rakuten_search' => 'rakutens#search'
end
