#Migration to create Goals table
class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |table|
      table.integer :user_id
      table.string :type
      table.integer :burned_calories
      table.integer :hearth_rate
      table.time :total_time
      table.datetime :time_started
      table.datetime :time_finished

      table.timestamps null: false
    end
  end
end
