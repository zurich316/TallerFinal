class CreateTypeGoals < ActiveRecord::Migration
  def change
    create_table :type_goals do |t|
      t.string :type
      t.string :DirImg

      t.timestamps null: false
    end
  end
end
