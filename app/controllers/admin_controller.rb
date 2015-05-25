class AdminController < ApplicationController
	before_action :authenticate_user! 
	def users
		@users=User.all.order(created_at: :desc)
	end 

	def lock_unlock
		@user=User.find(params[:id])
		if params[:status]=='true'
			@user.lock_access!
		else
			@user.unlock_access!
		end
		@user.save
		redirect_to '/users/', notice: 'Done.' 
	end

	def permitted_params
    		params.permit(:user => [:id, :status])
	end
end
