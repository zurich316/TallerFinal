class RemoveTypeGoalsIdToGoals < ActiveRecord::Migration
  def change
  	 remove_column :goals, :type_goals_id
  end
end
