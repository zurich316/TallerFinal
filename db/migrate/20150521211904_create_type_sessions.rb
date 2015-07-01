#Migration to create Type Sessions table
class CreateTypeSessions < ActiveRecord::Migration
  def change
    create_table :type_sessions do |table|

      table.timestamps null: false
    end
  end
end
