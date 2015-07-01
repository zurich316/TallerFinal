#Band migration to add a reference column
class AddBandTypeToBand < ActiveRecord::Migration
  def change
    add_reference :bands, :band_type, index: true
    add_foreign_key :bands, :band_types
  end
end
