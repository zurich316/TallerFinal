class TypeGoalgoer < ActiveRecord::Base
	has_many :goals
	has_many :type_goals , :through =>:goals
end
