class RoomChannel < ApplicationCable::Channel
  # チャンネル接続時に呼ばれる
  def subscribed
    stream_from "message_channel_#{params['room_id']}"
  end

  # メッセージをブロードキャストするためのアクション
  def speak(data)
    ChatMessage.create(chat_room_id: params[:room_id], user_id: 1, body: data['message'])
    ActionCable.server.broadcast "message_channel_#{params['room_id']}", message: data['message']
  end
end