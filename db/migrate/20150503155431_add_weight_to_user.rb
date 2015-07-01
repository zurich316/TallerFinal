#User migration for adding a Weight Column to  Users table
class AddWeightToUser < ActiveRecord::Migration
  def change
    add_column :users, :weight, :numeric
  end
end
