#Migration to create Auxiliar table to make reference
class CreateTypeSessiongoers < ActiveRecord::Migration
  def change
    create_table :type_sessiongoers do |table|

      table.timestamps null: false
    end
  end
end
