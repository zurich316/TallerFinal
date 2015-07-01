#Migration to create Weight Lifting Sessions table
class CreateWeightLiftingSessions < ActiveRecord::Migration
  def change
    create_table :weight_lifting_sessions do |table|
      table.string :muscle
      table.integer :series
      table.integer :fitness_session_id
      table.references :fitness_session, index: true
      table.timestamps null: false
    end
  end
end
