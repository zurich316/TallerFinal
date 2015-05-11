class RenameDirImgToTypeGoals < ActiveRecord::Migration
  def change
  	rename_column :type_goals, :DirImg, :img
  end
end
