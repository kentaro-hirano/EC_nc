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
    resources :items, only: [:index]
    resources :end_users, only: [:index]
  end

  scope module: :end_user do
    resources :end_users, only: [:show, :edit, :update] do
      collection do 
        get 'quit'
        patch 'withdraw'
      end
    end
  end
end
