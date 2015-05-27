class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  # GET /bands
  # GET /bands.json
  def index
    @bands = current_user.bands
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
  end

  # GET /bands/new
  def new
    @band = Band.new
  end

  # GET /bands/1/edit
  def edit
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = Band.new(band_params)
    if current_user.goals.count==0
      
        goals_automatics.each do |g|
              Goal.create(frequency: g[:frequency], goal: g[:goal], user_id: g[:user_id], type_goal_id: g[:type_goal_id], automatic_goal: g[:automatic], time_started:Time.now, time_finished:Time.now)       
      end
   end
    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @band.destroy
    respond_to do |format|
      format.html { redirect_to bands_url, notice: 'Band was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_params
      params.require(:band).permit(:code, :band_type_id, :user_id)
    end
    def goals_automatics
       if current_user.sex == "Male"
        goals = [{frequency:"Day",goal: steps_all,user_id:current_user.id,type_goal_id: 1,automatic:true},{frequency:"Day",goal: sleep_all,user_id:current_user.id,type_goal_id: 2,automatic:true},{frequency:"Year",goal: weight_all,user_id:current_user.id,type_goal_id: 3,automatic:true},{frequency:"Day",goal: calories_male,user_id:current_user.id,type_goal_id: 4,automatic:true}]
       else
        goals = [{frequency:"Day",goal: steps_all,user_id:current_user.id,type_goal_id: 1,automatic:true},{frequency:"Day",goal: sleep_all,user_id:current_user.id,type_goal_id: 2,automatic:true},{frequency:"Year",goal: weight_all,user_id:current_user.id,type_goal_id: 3,automatic:true},{frequency:"Day",goal: calories_female,user_id:current_user.id,type_goal_id: 4,automatic:true}]
       end
       return goals
    end
    def steps_all


    if years_calculate <= 13
     step1 = 15000

     return step1

    else 

        if years_calculate <= 50 && years_calculate > 13 
          step1=10000

          return step1
        else
          step1=2000


           return step1

        end
    end


  end

  

  def sleep_all  # calculo de suenho para personas mayores a los 14 anhos 

    if years_calculate < 18

      return sleep1 = 10
    end
    if years_calculate >= 18 && years_calculate < 26

      return sleep1 = 8
    end
    if years_calculate > 25 

      return sleep1 = 7
    end



  end

  

  def weight_all  # calcula el peso ideal
    weight_ideal = ((0.75*(current_user.height - 150))+ 50)

    return weight_ideal
  end

  

  def calories_male # calcula cuantas calorias debe quemar un hombre
    tmb = (10*current_user.weight)+(6.25*current_user.height)-(5*years_calculate)+5

    tmb_activo = tmb*0.50
    tmb = tmb + tmb_activo
    tmb_digestion = tmb*0.10
    tmb = tmb + tmb_digestion
    if current_user.weight - weight_all > 0

      return tmb = tmb + 500

    else

      return tmb

    end
  end

  def calories_female  # calcula cuantas calorias debe quemar una mujer

    tmb = (10*current_user.weight)+(6.25*current_user.height)-(5*years_calculate)-161

    tmb_activo = tmb*0.50
    tmb = tmb + tmb_activo
    tmb_digestion = tmb*0.10
    tmb = tmb + tmb_digestion
    if current_user.weight - weight_all > 0

      return tmb = tmb + 500

    else

      return tmb

    end


  end

  def years_calculate  # calcula la edad del usuario

    year1=current_user.birthdate.year
    year2= Time.now.year
    year1=year2-year1

    return year1

  end
 

end
