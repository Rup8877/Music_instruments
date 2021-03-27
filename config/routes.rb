# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'music_instruments#home'

  get 'signup', to: 'users#new'
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#google_create'

  resources :admin, only: [:index]

  resources :music_categories, path: '/admin/music_categories' do
    collection do 
      get 'fetch_sub_categories'
    end
    resources :sub_categories
  end

  get '/posted_items' => 'music_instruments#posted_items'
  get '/required_items' => 'music_instruments#required_items'
  get '/filter_by_price' => 'music_instruments#filter_by_price'
  get '/send_mail' => 'music_instruments#send_mail'

  scope '/admin' do
    get '/buyer_posts' => 'music_instruments#buyer_posts'
    get '/seller_posts' => 'music_instruments#seller_posts'

    resources :music_instruments, only: %i[approve reject] do
      member do
        patch :approve
        patch :reject
      end
    end
  end

  resources :music_instruments do
    resources :reviews
    collection do
      get 'search'
    end
  end

  resources :conversations do
    resources :messages
  end
end
