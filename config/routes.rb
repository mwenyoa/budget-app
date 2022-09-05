Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  resources :user do
    resources :categories, only: %i[index new show create]
    resources :transactions, only: %i[index new show create]
  end
end
