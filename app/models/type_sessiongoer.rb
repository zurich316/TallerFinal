class TypeSessiongoer < ActiveRecord::Base
	has_many :sessions
	has_many :type_sessions , :through =>:sessions
end
