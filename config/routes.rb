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

    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  root to: 'homes#top'
  get "/home/about" => "homes#about"



end
