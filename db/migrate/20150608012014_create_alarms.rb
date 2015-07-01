#Migration to create Alarms table
class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |table|
      table.time :time
      table.boolean :monday
      table.boolean :tuesday
      table.boolean :wednesday
      table.boolean :thursday
      table.boolean :friday
      table.boolean :saturday
      table.boolean :sunday
      table.string :message
      table.boolean :turn

      table.timestamps null: false
    end
  end
end
