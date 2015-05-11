class ChangeTimeStartedToGoals < ActiveRecord::Migration
  def change
  	change_column :goals, :time_started, :date
  	change_column :goals, :time_finished, :date
  end
end
