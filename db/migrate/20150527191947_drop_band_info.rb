class DropBandInfo < ActiveRecord::Migration
  def change
  	drop_table :band_infos
  end
end
