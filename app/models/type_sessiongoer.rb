class TypeSessiongoer < ActiveRecord::Base
	has_many :fitness_sessions
	has_many :type_sessions , :through =>:fitness_sessions
end
