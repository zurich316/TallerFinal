class AddDateRegsiteredAndHeartRateToBandInformation < ActiveRecord::Migration
  def change
    add_column :band_informations, :registered_date, :date
    add_column :band_informations, :heart_rate, :integer
  end
end
