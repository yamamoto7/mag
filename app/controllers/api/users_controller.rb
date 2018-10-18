class Api::UsersController < ApplicationController
  def get_info
    render json: current_user
  end
  def index
    render json: User.all
  end
  def show
    render json: User.find(params[:id])
  end
end
