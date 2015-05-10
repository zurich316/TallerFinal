class AddBandTypegoerIdToBand < ActiveRecord::Migration
  def change
    add_reference :bands, :band_typegoer, index: true
    add_foreign_key :bands, :band_typegoers
  end
end
