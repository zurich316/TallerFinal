#Controller for band information registers views and methods
class BandInformationsController < ApplicationController
  before_action :set_band_information, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  def home
  end

  def options
  end

  def today_work

    right_now=Time.now
    @today=current_user.bands.first.band_informations.where('registered_date BETWEEN ? AND ?',right_now.beginning_of_day, right_now.end_of_day)
  end

  def custom
    @flag=false
    right_now=Time.now
    if params["custom"]==nil
      @data=current_user.bands.first.band_informations.where('registered_date BETWEEN ? AND ?',right_now.beginning_of_day, right_now.end_of_day)
    else
      @initial= Time.new params["custom"]["initial_date(1i)"].to_i, params["custom"]["initial_date(2i)"].to_i, params["custom"]["initial_date(3i)"].to_i
      @final= Time.new params["custom"]["final_date(1i)"].to_i, params["custom"]["final_date(2i)"].to_i, params["custom"]["final_date(3i)"].to_i
      if @initial > @final || @initial > right_now || @final > right_now
        @flag=true 
        @data=current_user.bands.first.band_informations.where('registered_date BETWEEN ? AND ?',right_now.beginning_of_day, right_now.end_of_day)
      else
        @data=current_user.bands.first.band_informations.where('registered_date BETWEEN ? AND ?',@initial.beginning_of_day, @final.end_of_day)
      end
    end
  end

  def daily_comp
    right_now=Time.now
    @data=current_user.bands.first.band_informations.where('registered_date BETWEEN ? AND ?',right_now.beginning_of_week, right_now.end_of_week)
  end

  def weekly_comp
    right_now=Time.now
    @data=current_user.bands.first.band_informations.where('registered_date BETWEEN ? AND ?',right_now.beginning_of_month, right_now.end_of_month)
  
  end

  def monthly_comp
    right_now=Time.now
    @data=current_user.bands.first.band_informations.where('registered_date BETWEEN ? AND ?',right_now.beginning_of_year, right_now.end_of_year)
  
  end
  # GET /band_informations
  # GET /band_informations.json
  def index
    @band_informations = current_user.bands.first.band_informations.order(registered_date: :desc)
  end

  # GET /band_informations/1
  # GET /band_informations/1.json
  def show
  end

  # GET /band_informations/new
  def new
    @band_information = BandInformation.new
  end

  # GET /band_informations/1/edit
  def edit
  end

  # POST /band_informations
  # POST /band_informations.json
  def create
    @band_information = BandInformation.new(band_information_params)
    if @band_information.registered_date.nil?
      @band_information.registered_date=Time.now
    end
    respond_to do |format|
      if @band_information.save
        format.html { redirect_to @band_information, notice: 'Band information was successfully created.' }
        format.json { render :show, status: :created, location: @band_information }
      else
        format.html { render :new }
        format.json { render json: @band_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /band_informations/1
  # PATCH/PUT /band_informations/1.json
  def update
    respond_to do |format|
      if @band_information.update(band_information_params)
        format.html { redirect_to @band_information, notice: 'Band information was successfully updated.' }
        format.json { render :show, status: :ok, location: @band_information }
      else
        format.html { render :edit }
        format.json { render json: @band_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /band_informations/1
  # DELETE /band_informations/1.json
  def destroy
    @band_information.destroy
    respond_to do |format|
      format.html { redirect_to band_informations_url, notice: 'Band information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_information
      @band_information = BandInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_information_params
      params.require(:band_information).permit(:steps, :lat, :long, :user_id, :band_id,:calories, :registered_date, :heart_rate)
    end
    def custom_params
      params.require("custom").permit(:initial_date, :final_date)
    end
end
