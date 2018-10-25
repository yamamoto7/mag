class Api::Users::ChatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = current_user.chat_rooms
  end
  def show
    # messages = current_user.chat_rooms.find(params[:id]).chat_messages
    messages = ChatRoom.find(params[:id]).chat_messages
    render json: messages
  end
  def have_read_room
    messages = ChatRoom.find(params[:room_id]).chat_messages.where.not(user_id: current_user.id)
    messages.update_all(have_read: true)
    render json: messages
  end
  def new_message_count
    rooms = current_user.chat_rooms
    count = 0
    rooms.each do |r|
      tmp = r.get_new_message_count(current_user.id)
      if tmp then
        count += tmp
      end
    end
    render json: {count: count}
  end
  def get_room_user_id
    room = ChatRoom.find(params[:room_id])
    user = room.users.where.not(id: current_user.id).first
    render json: {id: user.id, first_name: user.first_name, last_name: user.last_name}
  end
end
