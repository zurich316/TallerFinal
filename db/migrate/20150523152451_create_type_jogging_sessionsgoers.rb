#Migration to create Auxiliar table to make a reference
class CreateTypeJoggingSessionsgoers < ActiveRecord::Migration
  def change
    create_table :type_jogging_sessionsgoers do |table|

      table.timestamps null: false
    end
  end
end
