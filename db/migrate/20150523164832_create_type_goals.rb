class CreateTypeGoals < ActiveRecord::Migration
  def change
    create_table :type_goals do |t|
      t.string :tip
      t.string :img
      t.references :goal, index: true
      t.timestamps null: false
    end
  end
end
