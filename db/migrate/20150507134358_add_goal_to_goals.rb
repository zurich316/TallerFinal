class AddGoalToGoals < ActiveRecord::Migration
  def change
  		add_column :goals, :goal, :integer
  end
end
