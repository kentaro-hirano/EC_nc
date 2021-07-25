Rails.application.routes.draw do
  root 'end_user/end_users#top'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :end_users, only: [:index, :show, :edit, :update] do
      member do
        get 'end_user_orders'
      end
    end
    resources :genres, only: [:new, :index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :end_user do
    resources :end_users, only: [:show, :edit, :update] do 
      collection do
        get 'quit'
        get "favorites"
        patch 'withdraw'
      end
    end
    resources :items, only: [:index, :show] do 
      resource :favorites, only: [:create, :destroy]
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end
end
