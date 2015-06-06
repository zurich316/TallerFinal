class DreamSessionsController < ApplicationController
  before_action :set_dream_session, only: [:show, :edit, :update, :destroy]

  # GET /dream_sessions
  # GET /dream_sessions.json
  def index
    @dream_sessions = current_user.dream_sessions.order(created_at: :desc)
  end

  # GET /dream_sessions/1
  # GET /dream_sessions/1.json
  def show
  end

  # GET /dream_sessions/new
  def new
    @dream_session = DreamSession.new
  end

  # GET /dream_sessions/1/edit
  def edit
  end

  # POST /dream_sessions
  # POST /dream_sessions.json
  def create
    @dream_session = DreamSession.new(dream_session_params)

    respond_to do |format|
      if @dream_session.save
        format.html { redirect_to @dream_session, notice: 'Dream session was successfully created.' }
        format.json { render :show, status: :created, location: @dream_session }
      else
        format.html { render :new }
        format.json { render json: @dream_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dream_sessions/1
  # PATCH/PUT /dream_sessions/1.json
  def update
    respond_to do |format|
      if @dream_session.update(dream_session_params)
        format.html { redirect_to @dream_session, notice: 'Dream session was successfully updated.' }
        format.json { render :show, status: :ok, location: @dream_session }
      else
        format.html { render :edit }
        format.json { render json: @dream_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dream_sessions/1
  # DELETE /dream_sessions/1.json
  def destroy
    @dream_session.destroy
    respond_to do |format|
      format.html { redirect_to dream_sessions_url, notice: 'Dream session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dream_session
      @dream_session = DreamSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dream_session_params
      params.require(:dream_session).permit(:time_started, :time_finished, :user_id, :band_id, :title)
    end
end
