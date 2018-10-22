class Api::Users::ChatsController < ApplicationController
  before_action :authenticate_user!
  def index
    rooms = current_user.chat_rooms
    render json: rooms
  end
  def show
    # messages = current_user.chat_rooms.find(params[:chat_room_id]).chat_messages
    # render json: messages
  end
end
