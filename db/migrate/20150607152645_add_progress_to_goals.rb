class AddProgressToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :progress, :integer
    add_column :goals, :complete, :boolean
  end
end
