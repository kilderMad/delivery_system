Rails.application.routes.draw do
  devise_for :users 
  root to: "home#index"
  resources :budget_histories , only: [:index]
  resources :carriers, only: [:index, :new, :show, :new, :create, :edit, :update] do
    resources :vehicles, only: [:new, :create, :show]
    resources :prices, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :deadlines, only: [:new, :create, :edit, :update, :index, :destroy]
    patch 'inactivate', on: :member
    patch 'reactivate', on: :member
  end
  resources :orders, only: [:index, :new, :create, :edit, :update] do
    resources :order_updates, only: [:index, :new, :create]
    member do
      patch 'accept'
      patch 'reject'
      patch 'select_vehicle'
      patch 'finish'
    end
    collection do
      get 'search'
      get 'budgets'
    end
  end
end
