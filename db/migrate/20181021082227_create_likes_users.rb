class CreateLikesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :likes_users do |t|
      t.references :user
      t.references :to_likes_user
      t.integer :status

      t.timestamps
    end
  end
end
