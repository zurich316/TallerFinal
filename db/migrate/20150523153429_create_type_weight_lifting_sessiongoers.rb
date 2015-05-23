class CreateTypeWeightLiftingSessiongoers < ActiveRecord::Migration
  def change
    create_table :type_weight_lifting_sessiongoers do |t|

      t.timestamps null: false
    end
  end
end
