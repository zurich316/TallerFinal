#Home controller to manage guest views
class HomeController < ApplicationController
	before_action :authenticate_user! , only: [:welcome, :users, :lock_unlock]
	def index
	end
	def contact_us
	end
	def welcome
	end

	
end
