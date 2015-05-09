class HomeController < ApplicationController
	before_action :authenticate_user! , only: [:welcome]
	
	def index
	end
	def contact_us
	end
	def welcome
	end
end
