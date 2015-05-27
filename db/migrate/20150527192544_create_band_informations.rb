class CreateBandInformations < ActiveRecord::Migration
  def change
    create_table :band_informations do |t|
      t.integer :steps
      t.decimal :lat
      t.decimal :long
      t.references :user, index: true, foreign_key: true
      t.references :band, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
