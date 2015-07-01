#User migration for adding a Last name Column to  Users table
class AddLastNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
  end
end
