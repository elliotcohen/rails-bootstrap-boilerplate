App::Application.routes.draw do

  get "dashboard/show"
  root :to => 'home#index'
  devise_for :users
  resource :account, only: [:edit, :update]
  #resources :users
  
end
