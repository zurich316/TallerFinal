class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.time :time
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :message
      t.boolean :turn

      t.timestamps null: false
    end
  end
end
