#Alarm model config and models
class Alarm < ActiveRecord::Base
	belongs_to :user
	validates :message , presence: true
end
