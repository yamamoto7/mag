class CreateRoomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :room_users do |t|
      t.references :user
      t.references :chat_room

      t.timestamps
    end
  end
end
