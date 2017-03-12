class RangeTimesMonthController < ApplicationController
	before_action :auth!, only: [:index, :edit]
  before_action :current_user, only: [:index]

  # GET /range_times_week
  # GET /range_times_week.json
	def index
  	Time.zone = current_user.time_zone
  
 		@total_seconds = total_seconds_month(current_user.id)
	end

	private
		def total_seconds_month (user_id)
		  RangeTime.user(user_id).month.select("day_range as day, sum(difference_seconds) as total_seconds").group("day_range")
		end
end
