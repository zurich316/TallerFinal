#Teype Session migration to add a reference column
class AddTipoToTypeSessions < ActiveRecord::Migration
  def change
    add_column :type_sessions, :tipo, :string
  end
end
