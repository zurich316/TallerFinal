class CreateTypeSessions < ActiveRecord::Migration
  def change
    create_table :type_sessions do |t|

      t.timestamps null: false
    end
  end
end
