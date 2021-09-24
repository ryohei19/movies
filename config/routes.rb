Rails.application.routes.draw do

devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }


  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :genres, except: [:new, :show]
  end


  resources :users do
    resource :relationships, only: [:create, :destroy]
      get 'index', to: 'relationships#index'
      member do
      get :movies
      get :goods
    end
  end

  resources :movies do
    resources :goods, only: [:create, :destroy]
  end

  resources :notifications, only: :index

  root 'homes#top'
  get 'search', to: 'search#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
