class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :type
      t.integer :burned_calories
      t.integer :hearth_rate
      t.time :total_time
      t.datetime :time_started
      t.datetime :time_finished

      t.timestamps null: false
    end
  end
end
