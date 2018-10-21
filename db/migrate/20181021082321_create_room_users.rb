class CreateRoomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :room_users do |t|
      t.integer :user_id
      t.integer :chat_room_id

      t.timestamps
    end
  end
end
