#Dream Session migration to add a Column 
class AddTitleToDreamSession < ActiveRecord::Migration
  def change
    add_column :dream_sessions, :title, :string
  end
end
