class CreateCyclingSessions < ActiveRecord::Migration
  def change
    create_table :cycling_sessions do |t|
      t.integer :distance
      t.integer :velocity
      t.integer :fitness_session_id
      t.references :fitness_session, index: true
      t.timestamps null: false
    end
  end
end
