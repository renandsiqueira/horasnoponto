class RangeTimesWeekController < ApplicationController
	before_action :auth!, only: [:index, :edit]
	before_action :current_user, only: [:index]

	# GET /range_times_week
	# GET /range_times_week.json
	def index
 		Time.zone = current_user.time_zone
 		@range_times = RangeTime.user(current_user.id).week()

 		@total_hours = total_hours_week(current_user.id)
 		@total_seconds = total_seconds_week(current_user.id)
	end

	private
		def total_hours_week (user_id)
		  RangeTime.user(user_id).week.select("day_range as day, sum(difference_hours) as total_hour").group("day_range")
		end

		def total_seconds_week (user_id)
		  RangeTime.user(user_id).week.select("day_range as day, sum(difference_seconds) as total_hour").group("day_range")
		end
end
