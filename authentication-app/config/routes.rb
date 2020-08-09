Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
  resources :comments, only: [:index, :show, :update, :destroy]
  resources :posts, only: [:index, :show, :update, :destroy]
  resources :users, only: [:index, :show, :update, :destroy] do 
    resources :posts, only: [:create] 
  end 
  resources :posts do 
      resources :users, only: [:index, :show] do 
      resources :comments, only: [:create]
    end 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
