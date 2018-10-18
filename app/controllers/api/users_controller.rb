class Api::UsersController < ApplicationController
  def get_info
    render json: current_user
  end
  def index
    render json: User.all
  end
end
