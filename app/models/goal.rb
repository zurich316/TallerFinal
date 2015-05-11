class Goal < ActiveRecord::Base
	belongs_to :user
	belongs_to :type_goal
	belongs_to :type_goalgoer
end
