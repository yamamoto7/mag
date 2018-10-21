class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes_items, class_name: "LikesUser", foreign_key: :user_id
  has_many :likes_users, through: :likes_items
  has_many :liked_items, class_name: "LikesUser", foreign_key: :to_likes_user_id
  has_many :liked_users, through: :liked_items

  has_many :room_users
  has_many :chat_rooms, through: :room_users

  has_many :survey_answers
  has_many :surveys, through: :survey_answers

  has_many :chat_messages
end
