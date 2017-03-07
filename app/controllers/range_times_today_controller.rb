class RangeTimesTodayController < ApplicationController
	before_action :auth!, only: [:index, :edit]
  	before_action :current_user, only: [:index]

    # GET /range_times_today
    # GET /range_times_today.json
	def index
    	Time.zone = current_user.time_zone
    	@range_times = RangeTime.user(current_user.id).today()

 		@total_hours = total_hours_today(current_user.id)
 		@total_seconds = total_seconds_today(current_user.id)
	end

	private
		def total_hours_today (user_id)
		  RangeTime.user(user_id).today.select("day_range as day, sum(difference_hours) as total_hour").group("day_range")
		end

		def total_seconds_today (user_id)
		  RangeTime.user(user_id).today.select("day_range as day, sum(difference_seconds) as total_seconds").group("day_range")
		end
end
