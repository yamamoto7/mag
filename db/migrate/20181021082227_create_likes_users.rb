class CreateLikesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :likes_users do |t|
      t.integer :user_id
      t.integer :to_likes_user_id
      t.integer :status

      t.timestamps
    end
  end
end
