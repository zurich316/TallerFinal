#Dream Sssion migration to remove a reference
class RemoveBandIdFromDreamSession < ActiveRecord::Migration
  def change
  	remove_reference :dream_sessions, :band  
  end
end
