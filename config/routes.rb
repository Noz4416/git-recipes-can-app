Rails.application.routes.draw do

  root to: 'recipes#index'
  # get '/about' => 'homes#about', as: "about"

  # ゲストログイン用アクション
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'users/mypage' => 'users#show'
  get 'users/unsubscribe' => 'users#unsubscribe'
  get 'recipes/search' => 'recipes#search'
  patch 'users/withdraw' => 'users#withdraw'

  resources :users, only:[:edit,:update]
  resources :units, only:[:index,:create,:destroy]
  resources :genres, only:[:index,:create,:destroy]
  resources :recipes, only:[:new,:index,:show,:edit,:create,:update,:destroy] do
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only:[:create,:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
