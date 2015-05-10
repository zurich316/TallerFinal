class AddBandTypeToBand < ActiveRecord::Migration
  def change
    add_reference :bands, :band_id, index: true
    add_foreign_key :bands, :band_ids
  end
end
