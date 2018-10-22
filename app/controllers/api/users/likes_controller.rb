class Api::Users::LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    # すでにイイネ送信済みだったら
    if current_user.likes_users.exists?(id: params[:user_id])
      render json: { error: 'you have already sent IINE to him.' }, status: 401
    # 相手からのイイネをすでに受け取っていたら
    elsif current_user.liked_users.exists?(id: params[:user_id])
      # イイネを作成してマッチを成立させる
      render json: {test: 1}
    # 上記以外の場合
    else
      # イイネを作成する
      render json: {test: 2}
    end
  end
end
