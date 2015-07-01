#Migration to create a auixiliar table to make the references
class CreateBandTypegoers < ActiveRecord::Migration
  def change
    create_table :band_typegoers do |table|

      table.timestamps null: false
    end
  end
end
