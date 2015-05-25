class AddTypeSessionToSessions < ActiveRecord::Migration
  def change
    add_reference :fitness_sessions, :type_session, index: true
    add_foreign_key :fitness_sessions, :type_sessions
  end
end
