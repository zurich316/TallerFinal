class CreateJoggingSessions < ActiveRecord::Migration
  def change
    create_table :jogging_sessions do |t|
      t.integer :distance
      t.integer :steps
      t.integer :fitness_session_id
      t.references :fitness_session, index: true
      t.timestamps null: false
    end
  end
end
