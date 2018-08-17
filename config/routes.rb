Rails.application.routes.draw do
  devise_for :users
  resources :orders do

    resources :signed_to_orders do
      member do
        post :accept
        post :dismiss
        post :chosed
      end
    end


  end
  root to: 'pages#home'
 end
