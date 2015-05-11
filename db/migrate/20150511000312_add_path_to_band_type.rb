class AddPathToBandType < ActiveRecord::Migration
  def change
    add_column :band_types, :path, :string
  end
end
