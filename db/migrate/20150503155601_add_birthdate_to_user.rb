#User migration for adding a Birthdate Columns to  Users table
class AddBirthdateToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :date
  end
end
