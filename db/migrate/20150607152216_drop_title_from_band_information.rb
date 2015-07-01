#Dream Session migration to remove a Column 
class DropTitleFromBandInformation < ActiveRecord::Migration
  def change
  	    remove_column :dream_sessions, :title
  end
end
