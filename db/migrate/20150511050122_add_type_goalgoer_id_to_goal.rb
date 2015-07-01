#Goal migration to add a reference column
class AddTypeGoalgoerIdToGoal < ActiveRecord::Migration
  def change
  	add_reference :goals, :type_goalgoer, index: true
    add_foreign_key :goals, :type_goalgoers
  end
end
