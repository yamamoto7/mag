Rails.application.routes.draw do
  get '/examples' => 'home#index'

  authenticated :user do
    # ログイン済みの場合のルート
    users_route = 'home#top'
    root users_route
    get '/users/chats' => users_route
    get '/users/chats/:id' => users_route
    get '/users/:id' => users_route
    get '/surveys' => 'home#index'
    get '/surveys/questions/:id' => 'home#index'
    get '/likes' => users_route
    get '/matchings' => users_route
    get '/mypage' => users_route
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
      resources :images, only: [:index,:create] 
      put '/chats/have_read_room' => 'chats#have_read_room'
      get '/chats/get_new_message_count/:room_id' => 'chats#get_new_message_count'
    end
    get '/users/get_info' => 'users#get_info'
    get '/users' => 'users#index'
    get '/users/:id' => 'users#show'

    resources :surveys, only: %i[index], shallow: true do
      post '/answer' => 'survey_answers#create'
      get '/questions' => 'survey_questions#index'
    end
    get 'survey/questions/:id' => 'survey_questions#show'

    mount ActionCable.server => '/cable'
  end
end
