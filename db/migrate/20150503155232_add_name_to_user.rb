#User migration for adding a Name Column to  Users table
class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
  end
end
