#Migration to create Band Information table to save Band Data
class CreateBandInformations < ActiveRecord::Migration
  def change
    create_table :band_informations do |table|
      table.integer :steps
      table.decimal :lat
      table.decimal :long
      table.references :user, index: true, foreign_key: true
      table.references :band, index: true, foreign_key: true

      table.timestamps null: false
    end
  end
end
