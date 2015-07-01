#Band migration to add a reference column
class RenameTypeIdToGoals < ActiveRecord::Migration
  def change

  	rename_column :goals, :type_id, :type_goals_id
  	add_reference :goals, :type_goal, index: true
    add_foreign_key :goals, :type_goals
  end
end
