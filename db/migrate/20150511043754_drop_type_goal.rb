class DropTypeGoal < ActiveRecord::Migration
  def change
  	drop_table :TypeGoal
  end
end
