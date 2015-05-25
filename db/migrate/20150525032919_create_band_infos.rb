class CreateBandInfos < ActiveRecord::Migration
  def change
    create_table :band_infos do |t|
      t.integer :steps
      t.integer :calories
      t.integer :lat
      t.integer :long

      t.timestamps null: false
    end
  end
end
