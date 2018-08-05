Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create, :update, :edit, :destroy]
  resources :offers do
    collection do
      post :confirm
    end
  end
  root to: 'home#index'
  resources :sessions, only: [:new, :create, :destroy]  
end
