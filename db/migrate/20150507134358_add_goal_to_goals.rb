#Goal migration for adding a Goal quantity column to Goals table
class AddGoalToGoals < ActiveRecord::Migration
  def change
  		add_column :goals, :goal, :integer
  end
end
