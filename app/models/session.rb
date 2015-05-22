class Session < ActiveRecord::Base
	belongs_to :user
	belongs_to :type_session
	belongs_to :type_sessiongoer
end
