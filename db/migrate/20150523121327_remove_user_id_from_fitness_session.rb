#Fitness Session migration to remove a reference
class RemoveUserIdFromFitnessSession < ActiveRecord::Migration
  def change
    remove_column :fitness_sessions, :user_id, :integer
  end
end
