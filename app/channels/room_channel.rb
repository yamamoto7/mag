class RoomChannel < ApplicationCable::Channel
  # チャンネル接続時に呼ばれる
  def subscribed
    stream_from "message_channel_#{params['room_id']}"
  end

  # メッセージをブロードキャストするためのアクション
  def speak(data)
    message = ChatMessage.create(chat_room_id: params[:room_id], user_id: params[:user_id], body: data['message'], submit_time: "#{DateTime.now.hour}:#{DateTime.now.min}")
    ActionCable.server.broadcast "message_channel_#{params['room_id']}", message: message
  end
end


