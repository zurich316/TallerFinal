class CreateBandTypegoers < ActiveRecord::Migration
  def change
    create_table :band_typegoers do |t|

      t.timestamps null: false
    end
  end
end
