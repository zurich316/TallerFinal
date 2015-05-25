class AddBandToBandInfo < ActiveRecord::Migration
  def change
    add_reference :band_infos, :band, index: true
    add_foreign_key :band_infos, :bands
  end
end
