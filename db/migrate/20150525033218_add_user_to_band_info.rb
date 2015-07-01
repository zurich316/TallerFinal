#Band Inform<tion migration to add a reference column
class AddUserToBandInfo < ActiveRecord::Migration
  def change
    add_reference :band_infos, :user, index: true
    add_foreign_key :band_infos, :users
  end
end
