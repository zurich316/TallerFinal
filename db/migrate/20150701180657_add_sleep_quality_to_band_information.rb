class AddSleepQualityToBandInformation < ActiveRecord::Migration
  def change
    add_column :band_informations, :sleep_quality, :integer
  end
end
