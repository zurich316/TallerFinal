class CreateTypeGoalgoers < ActiveRecord::Migration
  def change
    create_table :type_goalgoers do |t|

      t.timestamps null: false
    end
  end
end
