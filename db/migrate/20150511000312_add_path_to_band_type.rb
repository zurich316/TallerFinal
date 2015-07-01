#Band Type migration to add a image reference column
class AddPathToBandType < ActiveRecord::Migration
  def change
    add_column :band_types, :path, :string
  end
end
