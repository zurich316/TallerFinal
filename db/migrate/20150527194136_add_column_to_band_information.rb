#Band Information migration to add a reference
class AddColumnToBandInformation < ActiveRecord::Migration
  def change
    add_column :band_informations, :calories, :integer
  end
end
