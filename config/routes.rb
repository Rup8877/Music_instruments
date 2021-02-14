Rails.application.routes.draw do

  resources :users, only:[:index,:create]
  resources :sessions, only: [:create]
  get 'auth/:provider/callback' => 'sessions#google_create'
  get "log_out" => "sessions#destroy"

  resources :admin, only:[:index]

  resources :music_categories, path: '/admin/music_categories'

  root to:'music_instruments#home'

  scope '/admin' do
    get"/buyer_posts"  =>"music_instruments#buyer_posts"
    get"/seller_posts"  =>"music_instruments#seller_posts"
  end

  get"/posted_items"  =>"music_instruments#posted_items"
  get"/required_items"  =>"music_instruments#required_items"

  scope '/admin' do
  resources :music_instruments,only:[:approve,:reject] do
    member do
      patch:approve
      patch:reject
    end
    end
  end

  get "/send_mail" => "music_instruments#send_mail"

  resources :music_instruments do
   resources:reviews
    collection do
    get 'search'
    end
  end

  resources :conversations do
  resources :messages
    end














end
