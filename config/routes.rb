Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  resources :articles do
    resources :comments, only: :create
  end
  resources :users, only: :show do
    resources :golfers, only: [:index, :new, :create, :edit, :update]
    resources :posts, only: :index
    resources :favors, only: :index
  end
  post 'favor/:id' => 'favors#create', as: 'create_favor'
  delete 'favor/:id' => 'favors#destroy', as: 'destroy_favor'

end

