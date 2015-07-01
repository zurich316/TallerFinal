#Migration to create Band Types table
class CreateBandTypes < ActiveRecord::Migration
  def change
    create_table :band_types do |table|
      table.string :name

      table.timestamps null: false
    end
  end
end
