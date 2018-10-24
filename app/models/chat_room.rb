class ChatRoom < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users

  has_many :chat_messages

  def get_new_message_count user_id
    messages = self.chat_messages.where.not(user_id: user_id)
    count = messages.where(have_read: false).length
    if count > 0
      return count
    else
      return false
    end
  end
end
