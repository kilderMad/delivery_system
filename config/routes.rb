Rails.application.routes.draw do
  devise_for :users 
  root to: "home#index"
  resources :carriers, only: [:index, :new, :show, :new, :create, :edit, :update] do
    resources :vehicles, only: [:new, :create, :show]
    resources :prices, only: [:new, :create, :edit, :update, :index, :destroy]
  end
end
