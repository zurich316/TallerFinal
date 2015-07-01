#Migration to create Band Information table to save Band Data
class CreateBandInfos < ActiveRecord::Migration
  def change
    create_table :band_infos do |table|
      table.integer :steps
      table.integer :calories
      table.integer :lat
      table.integer :long

      table.timestamps null: false
    end
  end
end
