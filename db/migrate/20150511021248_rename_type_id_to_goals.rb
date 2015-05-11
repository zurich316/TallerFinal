class RenameTypeIdToGoals < ActiveRecord::Migration
  def change

  	rename_column :goals, :type_id, :type_goals_id
  end
end
