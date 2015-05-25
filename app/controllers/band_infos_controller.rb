class BandInfosController < ApplicationController
	def index
		  @band_infos=BandInfo.all
	end

	def show
		@band_info=BandInfo.find(params[:id])
	end

	def new
		@band_info=BandInfo.new
	end

	def create
		@band_info = BandInfo.new(bandi_params)
    	if @band_info.save
      		flash[:success] = "Succesfully created!"
     		 redirect_to @band_info
    	else
    	  render 'new'
   		 end

  	end
  def bandi_params
  		 params.require(:band_info).permit( :steps, :calories,
                                   :lat, :long, :created_at,:updated_at,
                                   :user_id,:band_id)
  end


end