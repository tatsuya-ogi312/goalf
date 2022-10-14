Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  resources :articles
  resources :users, only: :show do
    resources :golfers, only: [:index, :new, :create, :edit, :update]
  end
end

