#Migration to create Jogging Sessions table
class CreateJoggingSessions < ActiveRecord::Migration
  def change
    create_table :jogging_sessions do |table|
      table.integer :distance
      table.integer :steps
      table.integer :fitness_session_id
      table.references :fitness_session, index: true
      table.timestamps null: false
    end
  end
end
