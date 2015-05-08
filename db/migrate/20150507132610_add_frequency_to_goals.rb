class AddFrequencyToGoals < ActiveRecord::Migration
  def change
  	add_column :goals, :frequency, :string
  	add_column :goals, :type_id, :integer
  	remove_column :goals, :type, :string
  	remove_column :goals, :burned_calories, :integer
  	remove_column :goals, :hearth_rate, :integer
	remove_column :goals, :total_time, :time
  end
end


