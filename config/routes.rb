Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get '' => "homes#top"
    resources :orders_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :comfirm, :thanks, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  root to: 'homes#top'
  get "/home/about" => "homes#about"



end
