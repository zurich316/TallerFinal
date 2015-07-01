#Session migration to add a reference
class AddUserToSession < ActiveRecord::Migration
  def change
    add_reference :fitness_sessions, :user, index: true
    add_foreign_key :fitness_sessions, :users
  end
end
