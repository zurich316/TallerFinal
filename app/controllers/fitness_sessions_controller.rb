#Fitness session controller to manage database info
class FitnessSessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 


  def results
     @sessions = current_user.fitness_sessions
     @user=current_user
  end
  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = current_user.fitness_sessions
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = FitnessSession.find(params[:id])
    if @session.time_started != nil && @session.time_finished
        session_results
    end
  end


  def graf_session_results
    #@results = BandInformation.all()
    #@resuls = current_user.bands.first.band_informations.where('created_at BETWEEN ? AND ?',Time.now.beginning_of_day, Time.now.end_of_day)
    #session_results
   # @t1 = @session.time_started.to_time
    #@t2 = @session.time_finished.to_time
  end
  


  def session_results
    @session = FitnessSession.find(params[:id])
    @information = BandInformation.where('registered_date >= ? AND registered_date <= ?',@session.time_started,@session.time_finished)
    @pasos = 0
    @dist = 0
    @cal = 0
    @rt = 0
    @time_started = @session.time_started.to_time
    @time_finished = @session.time_finished.to_time
     
     @hash = Gmaps4rails.build_markers(@information) do |infor, marker|
        marker.lat infor.long
        marker.lng infor.lat
     end
  
    @information.each do |info|
          
            @pasos = @pasos + info.steps
            @cal = @cal + info.calories
            @dist = @pasos
            @rt += info.heart_rate
    end 
    if @information.count() != 0
        @rt = @rt/@information.count()
    end
  end



  # GET /sessions/new
  def new
    @session = FitnessSession.new
    @session.time_started=DateTime.now
  end

  def start
    @sessions = current_user.fitness_sessions.find(params[:id])
    @sessions.time_started=DateTime.now
    @sessions.save
    redirect_to '/fitness_sessions/',notice: ""
  end

  def end
    @sessions = current_user.fitness_sessions.find(params[:id])
    @sessions.time_finished=DateTime.now
    @sessions.save
    redirect_to '/fitness_sessions/',notice: ""
  end
  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = FitnessSession.create(session_params)
    if @session.type_session_id == 1
        CyclingSession.create(:fitness_session_id =>@session.id)
      elsif @session.type_session_id == 2
        WeightLiftingSession.create(:fitness_session_id =>@session.id)
      else
        JoggingSession.create(:fitness_session_id =>@session.id)
    end

    #respond_to do |format|
      if @session.save
         redirect_to '/fitness_sessions/',notice: ""
        #format.html { redirect_to @session, notice: 'Session was successfully created.' }
        #format.json { render :show, status: :created, location: @session }
      else
        #format.html { render :new }
         redirect_to '/fitness_sessions/',notice: ""
        #format.json { render json: @session.errors, status: :unprocessable_entity }
      #end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    redirect_to '/fitness_sessions/',notice: ""
    #respond_to do |format|
      #format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = FitnessSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:fitness_session).permit(:user_id, :type_sessiongoer_id, :type_session_id, :burned_calories, :hearth_rate, :total_time, :time_started, :time_finished)
    end
end

