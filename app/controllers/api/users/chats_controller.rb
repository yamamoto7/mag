class Api::Users::ChatsController < ApplicationController
  before_action :authenticate_user!
  def index
    rooms = current_user.chat_rooms
    render json: rooms
  end
  def show
    # messages = current_user.chat_rooms.find(params[:id]).chat_messages
    messages = ChatMessage.all
    render json: messages
  end
end
