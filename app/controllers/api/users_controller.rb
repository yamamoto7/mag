class Api::UsersController < ApplicationController
  def get_info
    render json: current_user
  end
end
