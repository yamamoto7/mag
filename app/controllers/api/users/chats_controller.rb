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
  def have_read_room
    messages = ChatRoom.find(params[:room_id]).chat_messages.where(user_id: !current_user.id)
    messages.update_all(have_read: true)
    render json: messages
  end
  def have_read_message
    message = ChatMessage.find(params[:message_id])
    if !message.have_read && message.user_id != current_user.id then
      message.have_read = true
      message.update
      render json: message
    end
    render json: message
  end
end
