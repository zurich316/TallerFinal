class RemoveTypeSessionIdFromFitnessSession < ActiveRecord::Migration
  def change
    remove_column :fitness_sessions, :type_session_id, :integer
  end
end
