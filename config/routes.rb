Rails.application.routes.draw do
  devise_for :users
  
  unauthenticated :user do
    root to: 'splashs#index'
  end

  authenticated :user do
    root "categories#index", as: :authenticated_root
  end
  resources :user do
    resources :categories, only: %i[index new show create destroy] do
      resources :payments, only: %i[index new show create destroy]
    end
  end
end
