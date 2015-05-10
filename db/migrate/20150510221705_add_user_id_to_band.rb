class AddUserIdToBand < ActiveRecord::Migration
  def change
    add_reference :bands, :user_id, index: true
    add_foreign_key :bands, :user_ids
  end
end
