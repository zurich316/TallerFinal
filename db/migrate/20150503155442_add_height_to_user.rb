#User migration for adding a Height Column to  Users table
class AddHeightToUser < ActiveRecord::Migration
  def change
    add_column :users, :height, :numeric
  end
end
