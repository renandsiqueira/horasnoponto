class RangeTimesController < ApplicationController
  before_action :set_range_time, only: [:show, :edit, :update, :destroy]

  # GET /range_times
  # GET /range_times.json
  def index
    @range_times = RangeTime.all
  end

  # GET /range_times/1
  # GET /range_times/1.json
  def show
  end

  # GET /range_times/new
  def new
    @range_time = RangeTime.new
  end

  # GET /range_times/1/edit
  def edit
  end

  # POST /range_times
  # POST /range_times.json
  def create
    @range_time = RangeTime.new(range_time_params)

    respond_to do |format|
      if @range_time.save
        format.html { redirect_to @range_time, notice: 'Range time was successfully created.' }
        format.json { render :show, status: :created, location: @range_time }
      else
        format.html { render :new }
        format.json { render json: @range_time.errors, status: :unprocessable_entity }
      end
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_range_time
      @range_time = RangeTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def range_time_params
      params.require(:range_time).permit(:start_time, :end_time, :difference_hours, :difference_seconds, :date, :user_id)
    end
end
