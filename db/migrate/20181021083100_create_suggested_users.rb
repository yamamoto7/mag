class CreateSuggestedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :suggested_users do |t|
      t.references :user
      t.references :suggested_user

      t.timestamps
    end
  end
end
