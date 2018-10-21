class Api::UsersController < ApplicationController
  def get_info
    render json: current_user
  end
  def index
    render json: User.all
  end
  def show
    @user = User.find(params[:id])
    @have_already_liked = current_user.likes_users.exists?(id: params[:id])
  end
end
