Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :tweets, only: :create
    post "add_like", on: :member
    delete "remove_like", on: :member
  end
  resources :users

  root "tweets#index"
  
  namespace :api do
    resources :tweets, only: %i[index show]
  end

end
