class AddAutomaticGoalToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :automatic_goal, :boolean
  end
end
