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
  def get_new_message_count
    messages = ChatRoom.find(params[:room_id]).chat_messages.where(user_id: !current_user.id)
    count = messages.where(have_read: false)
    render json: {count: count}
  end
  def have_read_room
    messages = ChatRoom.find(params[:room_id]).chat_messages.where(user_id: !current_user.id)
    messages.update_all(have_read: true)
    render json: messages
  end
end
