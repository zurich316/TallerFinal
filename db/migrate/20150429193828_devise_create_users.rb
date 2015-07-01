#User migration for registering
class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |table|
      ## Database authenticatable
      table.string :email,              null: false, default: ""
      table.string :encrypted_password, null: false, default: ""

      ## Recoverable
      table.string   :reset_password_token
      table.datetime :reset_password_sent_at

      ## Rememberable
      table.datetime :remember_created_at

      ## Trackable
      table.integer  :sign_in_count, default: 0, null: false
      table.datetime :current_sign_in_at
      table.datetime :last_sign_in_at
      table.string   :current_sign_in_ip
      table.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
