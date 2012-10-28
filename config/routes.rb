App::Application.routes.draw do

  get "dashboard/show"
  root :to => 'home#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resource :account, only: [:edit, :update]
  
end
