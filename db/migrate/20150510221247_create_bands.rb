#Migration to create Bands table
class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |table|
      table.string :code

      table.timestamps null: false
    end
  end
end
