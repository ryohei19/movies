Rails.application.routes.draw do

devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }


  devise_for :admin, skip: [:registrations], controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
  }

  namespace :admin do
    resources :genres, except: [:new, :show]
    resources :user_datas, only: [:index, :show]
  end


  resources :users, only: [:show, :edit, :update] do
    get 'timeline', to: 'users#timeline'
    resource :relationships, only: [:create, :destroy]
      get 'index', to: 'relationships#index'
  end

  resources :movies, except: [:index, :edit, :update] do
    resources :goods, only: [:create, :destroy]
  end

  resources :notifications, only: [:index]

  root 'homes#top'
  get 'search', to: 'search#search'
  get 'form', to: 'search#form'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
