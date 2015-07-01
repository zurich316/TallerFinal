#Migration to create Auxiliar table to make a reference
class CreateTypeWeightLiftingSessiongoers < ActiveRecord::Migration
  def change
    create_table :type_weight_lifting_sessiongoers do |table|

      table.timestamps null: false
    end
  end
end
