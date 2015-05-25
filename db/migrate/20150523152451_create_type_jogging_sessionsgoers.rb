class CreateTypeJoggingSessionsgoers < ActiveRecord::Migration
  def change
    create_table :type_jogging_sessionsgoers do |t|

      t.timestamps null: false
    end
  end
end
