class TypeGoal < ActiveRecord::Base
	has_many :goals
	has_many :type_goalgoer, :through => :goals
	has_many :type_goalgoers, :through => :goals
end
