class User < ApplicationRecord
  enum status: [:one_way, :matched, :rejected]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :diagnoses, class_name: 'Diagnosis', foreign_key: :diagnoses_id
  has_many :likes_items, class_name: "LikesUser", foreign_key: :user_id
  has_many :likes_users, through: :likes_items
  has_many :liked_items, class_name: "LikesUser", foreign_key: :to_likes_user_id
  has_many :liked_users, through: :liked_items

  has_many :room_users
  has_many :chat_rooms, through: :room_users

  has_many :survey_answers
  has_many :surveys, through: :survey_answers

  has_many :chat_messages

  has_many :user_images

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :last_kana, presence: true
  validates :phone_number,    length: { in: 10..11 }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_date, presence: true
end
