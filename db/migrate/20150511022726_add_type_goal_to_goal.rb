class AddTypeGoalToGoal < ActiveRecord::Migration
  def change
  
    add_reference :goals, :type_goal, index: true
    add_foreign_key :goals, :type_goals

    
  end
  
end
