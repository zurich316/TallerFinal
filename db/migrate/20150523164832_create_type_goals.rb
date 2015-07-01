#Migration to create Goal Type table
class CreateTypeGoals < ActiveRecord::Migration
  def change
    create_table :type_goals do |table|
      table.string :tip
      table.string :img
      table.references :goal, index: true
      table.timestamps null: false
    end
  end
end
