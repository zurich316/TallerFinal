#User migration for adding a Sex Column to  Users table
class AddSexToUser < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string
  end
end
