# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :first_name
      t.string :last_name
      t.string :first_kana
      t.string :last_kana

      t.integer :sex
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_date
      # どうせ最初の0いらないからint
      t.integer :phone_number, limit: 8

      t.integer :tall
      t.integer :weight_type
      t.integer :academic
      t.integer :blood_type

      t.string :state
      t.string :birth_state
      t.string :brother
      t.string :martial_status
      t.string :childlen

      t.string :salary
      t.string :job
      t.string :job_detail
      t.string :academic_status

      t.string :holiday
      t.string :check_point
      t.string :when_meet
      t.string :date_cost

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
