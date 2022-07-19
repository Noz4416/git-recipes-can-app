Rails.application.routes.draw do

  root to: 'homes#top'
  get '/about' => 'homes/about', as: "about"


  devise_for :users
  get 'users/mypage' => 'users#sshow'
  get 'users/unsubscribe' => 'users#unsubscribe'


  resources :foodstuffs, only:[:new, :edit]
  resources :nutritions, only:[:new, :edit]
  resources :units, only:[:new,:edit]
  resources :genres, only:[:new,:show]
  resources :recipes, only:[:new,:index,:show,:edit]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
