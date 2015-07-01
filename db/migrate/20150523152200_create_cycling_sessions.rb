#Migration to create Cycling ableSessions table
class CreateCyclingSessions < ActiveRecord::Migration
  def change
    create_table :cycling_sessions do |table|
      table.integer :distance
      table.integer :velocity
      table.integer :fitness_session_id
      table.references :fitness_session, index: true
      table.timestamps null: false
    end
  end
end
