class CreateTypeCyclingSessionsgoers < ActiveRecord::Migration
  def change
    create_table :type_cycling_sessionsgoers do |t|

      t.timestamps null: false
    end
  end
end
