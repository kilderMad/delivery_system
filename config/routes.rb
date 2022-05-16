Rails.application.routes.draw do
  root to: "home#index"
  resources :carriers, only: [:index, :new, :show, :new, :create, :edit, :update]
end
