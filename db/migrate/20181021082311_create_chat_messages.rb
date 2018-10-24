class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.references :user
      t.references :chat_room
      t.string :body
      t.string :submit_time
      t.boolean :have_read, default: false

      t.timestamps
    end
  end
end
