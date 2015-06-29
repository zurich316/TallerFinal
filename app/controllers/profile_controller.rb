class ProfileController < ApplicationController
	before_action :authenticate_user!

	def show
		@user=current_user
	end
	def simulation
	end
	def download
		send_file Rails.root.join('public', 'api01.zip'), :type=>"application/zip", :x_sendfile=>true
	end
end
