#Alarm migration to add a reference 
class AddUserToAlarms < ActiveRecord::Migration
  def change
    add_reference :alarms, :user, index: true, foreign_key: true
  end
end
