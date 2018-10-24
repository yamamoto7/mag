Rails.application.routes.draw do
  get '/examples' => 'home#index'

  authenticated :user do
    # ログイン済みの場合のルート
    users_route = 'home#top'
    root users_route
    get '/users/chats' => users_route
    get '/users/chats/:id' => users_route
    get '/users/:id' => users_route
    get '/likes' => users_route
    get '/matchings' => users_route
  end

  # 未ログインの場合のルート
  root 'users#new_session'
  get '/sign_up' => 'users#new_registration'


  devise_for :user, only: []

  namespace :api, defaults: { format: :json } do
    namespace :users do
      resource :sign_in, only: [:create], controller: :sessions # api/users/sign_in
      resource :sign_out, only: [:destroy], controller: :sessions # api/users/sign_out
      resource :sign_up, only: [:create], controller: :registrations # api/users/sign_up

      resources :likes, only: [:index, :create]
      resources :chats, only: [:index, :show] 
      put '/chats/have_read_message' => 'chats#have_read_message'
      put '/chats/have_read_room' => 'chats#have_read_room'
    end
    get '/users/get_info' => 'users#get_info'
    get '/users' => 'users#index'
    get '/users/:id' => 'users#show'
  end

  mount ActionCable.server => '/cable'

end
