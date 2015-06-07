class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /goals
  # GET /goals.json
  def index

    @goals = current_user.goals
    
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    calculate_progress
    ##complete_goal
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:user_id, :type_goal_id, :frequency, :goal, :time_started, :time_finished,:automatic_goal, :progress, :complete)
    end

    def calculate_progress
      @goal = Goal.find(params[:id])
      info = BandInformation.all()
      @goal.progress=0
      info.each do |one|

        calculate_day(one)
        calculate_month(one)
        calculate_year(one)
        complete_goal

       
       
      

      end
    end

    def calculate_steps(one)
       if @goal.type_goal.tip == "Steps"
         @goal.progress = @goal.progress + one.steps
       end
    end
    def calculate_calories(one)
       if @goal.type_goal.tip == "Calories"
        @goal.progress = @goal.progress + one.calories
       end
    end

    def calculate_day(one)
      if @goal.frequency=="Day" && @goal.created_at.month == one.created_at.month && @goal.created_at.day == one.created_at.day && @goal.created_at.year == one.created_at.year
       calculate_calories(one)
      calculate_steps(one)
      end 
    end

    def calculate_month(one)
      if @goal.frequency=="Month" && @goal.created_at.month == one.created_at.month && @goal.created_at.year == one.created_at.year
      calculate_calories(one)
      calculate_steps(one)
      end 
    end

    def calculate_year(one)
      if @goal.frequency=="Year" && @goal.created_at.year == one.created_at.year
       calculate_calories(one)
      calculate_steps(one)
      end 
    end

    def complete_goal
      if @goal.progress == @goal.goal
        @goal.complete == true
      else 
        @goal.complete == false

      end
    end
    

end

  
