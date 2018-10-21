class LikesUser < ApplicationRecord
  belongs_to :liked_user, class_name: "User", foreign_key: :user_id
  belongs_to :likes_user, class_name: "User", foreign_key: :to_likes_user_id
end
