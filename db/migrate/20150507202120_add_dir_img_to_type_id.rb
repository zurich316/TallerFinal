class AddDirImgToTypeId < ActiveRecord::Migration
  def change
  	add_column :TypeGoal, :DirImg, :string
  end
end
