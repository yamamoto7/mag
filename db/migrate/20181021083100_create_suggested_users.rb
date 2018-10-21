class CreateSuggestedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :suggested_users do |t|
      t.integer :user_id
      t.integer :suggested_user_id

      t.timestamps
    end
  end
end
