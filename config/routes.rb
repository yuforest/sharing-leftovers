Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create, :update, :edit, :destroy]
  resources :leftovers do
    collection do
      post :confirm
    end
  end
  get "/about" => "home#about"
  root to: 'home#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :offers, only: [:create, :destroy]
  resources :conversations do
    resources :messages
  end
end
