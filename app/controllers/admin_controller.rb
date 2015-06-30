#Admin controller is used to give different options to lock and unlock users
class AdminController < ApplicationController
	#Admin controller
	before_action :authenticate_user! 
	def users
		#Shows all users
		@users=User.all.order(created_at: :desc)
	end 

	def lock_unlock
		#This locks and unlocks users
		@user=User.find(params[:id])
		if params[:status]=='true'
			#To lock user access
			@user.lock_access!
		else
			#To unlock user access
			@user.unlock_access!
		end
		@user.save
		redirect_to '/users/', notice: 'Done.' 
	end

	def permitted_params
		#These are permitted parameters
    		params.permit(:user => [:id, :status])
	end
end
