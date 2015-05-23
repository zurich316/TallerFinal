class CreateTypeSessiongoers < ActiveRecord::Migration
  def change
    create_table :type_sessiongoers do |t|

      t.timestamps null: false
    end
  end
end
