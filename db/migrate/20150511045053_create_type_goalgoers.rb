#Migration to create Auxiliar table to make a reference
class CreateTypeGoalgoers < ActiveRecord::Migration
  def change
    create_table :type_goalgoers do |table|

      table.timestamps null: false
    end
  end
end
