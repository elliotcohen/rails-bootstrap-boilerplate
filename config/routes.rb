App::Application.routes.draw do

  root :to => 'dashboard#show'
  devise_for :users
  resources :users
  
end
