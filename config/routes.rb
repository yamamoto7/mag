Rails.application.routes.draw do
  get '/examples' => 'home#index'

  # ログイン済みの場合のルート
  authenticated :user do
    root 'home#top'
  end

  # 未ログインの場合のルート
  root 'users#new_session'
  get '/sign_up' => 'users#new_registration'


  devise_for :user, only: []

  namespace :api, defaults: { format: :json } do
    get '/users/get_info' => 'users#get_info'
    get '/users' => 'users#index'
    get '/users/:id' => 'users#show'
    namespace :users do
      resource :sign_in, only: [:create], controller: :sessions # users/sign_in
      resource :sign_out, only: [:destroy], controller: :sessions #users/sign_out
      resource :sign_up, only: [:create], controller: :registrations # users/sign_up
    end
  end

end
