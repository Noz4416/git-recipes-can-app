Rails.application.routes.draw do

  root to: 'recipes#index'

  # ゲストログイン用アクション
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  # sign_upでエラーが出た後、リロードでのエラー回避
    get 'users', to: 'devise/registrations#new'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  # get 'users/mypage' => 'users#show'
  # get 'users/unsubscribe' => 'users#unsubscribe'
  # get 'recipes/search' => 'recipes#search'
  # patch 'users/withdraw' => 'users#withdraw'

  resources :users, only:[:edit,:update] do
    collection do
      get :mypage, action: :show
      get :unsubscribe
      patch :withdraw
    end
  end

  resources :recipes, only:[:new,:index,:show,:edit,:create,:update,:destroy] do
    collection do
      get :bookmarks
      get :search
    end
  end

  resources :units, only:[:index,:create,:destroy]
  resources :genres, only:[:index,:create,:destroy]
  resources :bookmarks, only:[:create,:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
