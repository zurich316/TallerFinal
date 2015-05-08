class TypeGoal < ActiveRecord::Migration
  def change
  	create_table :TypeGoal do |t|
      t.string :type
  end
end
end
