class AddUserToBand < ActiveRecord::Migration
  def change
    add_reference :bands, :user, index: true
    add_foreign_key :bands, :users
  end
end
