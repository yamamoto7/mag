Rails.application.routes.draw do
  get '/examples' => 'home#index'
  get '/sign_up' => 'home#sign_up'

  authenticated :user do
    # ログイン済みの場合のルート
    users_route = 'home#top'
    root users_route
    get '/users/chats' => users_route
    get '/users/chats/:id' => users_route
    get '/users/:id' => users_route
    get '/surveys' => 'home#survey'
    get '/surveys/questions/:id' => 'home#survey'
    get '/surveys/result' => 'home#survey_result'
    get '/likes' => users_route
    get '/matchings' => users_route
    get '/mypage' => users_route
    get '/suggested' => users_route
    get '/save_image' => 'home#save_image'
  end

  # 未ログインの場合のルート
  root 'home#auth'
  get '/login' => 'home#auth'

  devise_for :user, only: []

  namespace :api, defaults: { format: :json } do
    namespace :users do
      resource :sign_in, only: [:create], controller: :sessions # api/users/sign_in
      resource :sign_out, only: [:destroy], controller: :sessions # api/users/sign_out
      resource :sign_up, only: [:create], controller: :registrations # api/users/sign_up

      put '/chats/have_read_room' => 'chats#have_read_room'
      get '/chats/get_room_user/:room_id' => 'chats#get_room_user'
      get '/chats/new_message_count' => 'chats#new_message_count'
      get '/chats/get_new_message_count/:room_id' => 'chats#get_new_message_count'
      get '/images/:user_id' => 'images#index'
      resources :likes, only: [:index, :create]
      resources :chats, only: [:index, :show]
      resources :images, only: [:create]
    end
    get '/users/get_info' => 'users#get_info'
    get '/users' => 'users#index'
    get '/users/rand' => 'users#rand_index'
    get '/users/matching' => 'users#matching_index'
    get '/users/:id' => 'users#show'
    resource :users, only: [:update]

    resources :surveys, only: %i[show], shallow: true do
      post '/answer' => 'survey_answers#create'
      get '/questions' => 'survey_questions#index'
    end
    get 'survey/questions/:id' => 'survey_questions#show'

    mount ActionCable.server => '/cable'
  end
end
