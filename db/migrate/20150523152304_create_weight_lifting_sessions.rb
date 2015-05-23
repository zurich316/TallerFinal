class CreateWeightLiftingSessions < ActiveRecord::Migration
  def change
    create_table :weight_lifting_sessions do |t|
      t.string :muscle
      t.integer :series
      t.integer :fitness_session_id
      t.references :fitness_session, index: true
      t.timestamps null: false
    end
  end
end
