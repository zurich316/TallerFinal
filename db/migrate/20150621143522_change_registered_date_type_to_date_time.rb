#Band Information migration to change a Column 
class ChangeRegisteredDateTypeToDateTime < ActiveRecord::Migration
  def change
  	change_column :band_informations, :registered_date,  :datetime
  end
end
