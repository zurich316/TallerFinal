class BandInfosController < ApplicationController
	  before_action :authenticate_user! 

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

    respond_to do |format|
      if @band_info.save
        format.html { flash[:success] = "Succesfully created!"
         redirect_to @band_info }
        format.json { render :show, status: :created, location: @band_info }
      else
        format.html { render :new }
        format.json { render json: @band_info.errors, status: :unprocessable_entity }
      end
    end



  end
  def bandi_params
  		 params.require(:band_info).permit( :steps, :calories,
                                   :lat, :long, :created_at,:updated_at,
                                   :user_id,:band_id)
  end


end