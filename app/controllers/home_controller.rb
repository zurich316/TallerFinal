class HomeController < ApplicationController
	before_action :authenticate_user! , only: [:welcome]
	attr
	def index
	end
	def contact_us
	end
	def welcome
	end
	def users
		@users=User.all
	end 
	def lock_unlock
		@user=User.find(params[:id])
		if params[:status]
			@user.lock_access!
		else
			@user.unlock_access!
		end
		redirect_to "/users"
	end
	def permitted_params
    		params.permit(:user => [:id, :status])
	end
end
