#Migration to create Dream Session table
class CreateDreamSessions < ActiveRecord::Migration
  def change
    create_table :dream_sessions do |table|
      table.datetime :time_started
      table.datetime :time_finished
      table.references :user, index: true, foreign_key: true
      table.references :band, index: true, foreign_key: true

      table.timestamps null: false
    end
  end
end
