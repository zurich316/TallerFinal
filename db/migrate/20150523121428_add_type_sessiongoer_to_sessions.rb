#Session migration to add a reference
class AddTypeSessiongoerToSessions < ActiveRecord::Migration
  def change
    add_reference :fitness_sessions, :type_sessiongoer, index: true
    add_foreign_key :fitness_sessions, :type_sessiongoers
  end
end
