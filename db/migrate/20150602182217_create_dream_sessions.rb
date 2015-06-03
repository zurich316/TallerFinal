class CreateDreamSessions < ActiveRecord::Migration
  def change
    create_table :dream_sessions do |t|
      t.datetime :time_started
      t.datetime :time_finished
      t.references :user, index: true, foreign_key: true
      t.references :band, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
