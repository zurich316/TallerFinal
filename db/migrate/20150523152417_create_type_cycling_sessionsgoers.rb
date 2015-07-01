#Migration to create Auxiliar table to make a reference
class CreateTypeCyclingSessionsgoers < ActiveRecord::Migration
  def change
    create_table :type_cycling_sessionsgoers do |table|

      table.timestamps null: false
    end
  end
end
