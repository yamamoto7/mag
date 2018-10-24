class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.references :user
      t.references :chat_room
      t.string :body
      t.string :submit_time

      t.timestamps
    end
  end
end
