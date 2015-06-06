class RemoveBandIdFromDreamSession < ActiveRecord::Migration
  def change
  	remove_reference :dream_sessions, :band  
  end
end
