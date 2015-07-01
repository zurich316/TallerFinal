#Goal migration for changing a Time started and finished Column from goals table
class ChangeTimeStartedToGoals < ActiveRecord::Migration
  def change
  	change_column :goals, :time_started, :date
  	change_column :goals, :time_finished, :date
  end
end
