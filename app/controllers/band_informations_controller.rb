class BandInformationsController < ApplicationController
  before_action :set_band_information, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  def home
  end
  # GET /band_informations
  # GET /band_informations.json
  def index
    @band_informations = current_user.bands.first.band_informations.order(created_at: :desc)
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
      params.require(:band_information).permit(:steps, :lat, :long, :user_id, :band_id,:calories)
    end
end
