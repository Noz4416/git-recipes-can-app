Rails.application.routes.draw do

  root to: 'homes#top'
  get '/about' => 'homes#about', as: "about"

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


  resources :foodstuffs, only:[:new, :edit]
  resources :nutritions, only:[:new, :edit]
  resources :units, only:[:new,:edit]
  resources :genres, only:[:new,:show]
  resources :recipes, only:[:new,:index,:show,:edit,:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
