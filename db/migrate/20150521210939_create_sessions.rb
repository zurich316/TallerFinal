#Migration to create Sessions table
class CreateSessions < ActiveRecord::Migration
  def change
    create_table :fitness_sessions do |table|
      table.integer :burned_calories
      table.integer :hearth_rate
      table.time :total_time
      table.datetime :time_started
      table.datetime :time_finished

      table.timestamps null: false
    end
  end
end
