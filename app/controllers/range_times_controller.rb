class RangeTimesController < ApplicationController
  before_action :auth!, only: [:index, :edit]
  before_action :current_user, only: [:index]
  before_action :set_range_time, only: [:show, :edit, :update, :destroy]
 
  # GET /range_times
  # GET /range_times.json
  def index
    Time.zone = current_user.time_zone
    @range_times = RangeTime.user(current_user.id).today()

    set_sum(@range_times)
  end

  # GET /range_times/1
  # GET /range_times/1.json
  def show
  end

  # GET /range_times/1/edit
  def edit
  end

  # GET /range_times/new
  def new
    @range_time = RangeTime.user(current_user.id).order("created_at").last
  end

  # POST /range_times
  # POST /range_times.json
  def create
    r = RangeTime.user(current_user.id).without_end.order("created_at").last

    if r.nil?
      r = RangeTime.new(start_time: DateTime.now, user: current_user)
    else
      r.difference_time(DateTime.now)
    end
    r.save

    redirect_to :controller => 'range_times', :action => 'new'
  end

  # PATCH/PUT /range_times/1
  # PATCH/PUT /range_times/1.json
  def update
    respond_to do |format|
      if @range_time.update(range_time_params)
        format.html { redirect_to @range_time, notice: 'Range time was successfully updated.' }
        format.json { render :show, status: :ok, location: @range_time }
      else
        format.html { render :edit }
        format.json { render json: @range_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /range_times/1
  # DELETE /range_times/1.json
  def destroy
    @range_time.destroy
    respond_to do |format|
      format.html { redirect_to range_times_url, notice: 'Range time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sum(range_times)
      @sum_hour = 0.0
      @sum_seconds = 0.0

      range_times.each do |r|
        if r.difference_hours != nil
          @sum_hour += r.difference_hours
          @sum_seconds += r.difference_seconds
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_range_time
      @range_time = RangeTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def range_time_params
      params.require(:range_time).permit(:start_time, :end_time, :difference_hours, :difference_seconds, :date, :user_id)
    end
end
