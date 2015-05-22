class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.integer :type_sessiongoer_id
      t.integer :type_session_id
      t.integer :burned_calories
      t.integer :hearth_rate
      t.time :total_time
      t.datetime :time_started
      t.datetime :time_finished

      t.timestamps null: false
    end
  end
end
