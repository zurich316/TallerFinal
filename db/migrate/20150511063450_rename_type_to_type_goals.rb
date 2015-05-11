class RenameTypeToTypeGoals < ActiveRecord::Migration
  def change
  	rename_column :type_goals, :type, :tip
  end
end
