class RangeTimesWeekController < ApplicationController
	before_action :auth!, only: [:index, :edit]
	before_action :current_user, only: [:index]

	# GET /range_times_week
	# GET /range_times_week.json
	def index
 	Time.zone = current_user.time_zone
 	@range_times = RangeTime.user(current_user.id).month()
	end
end
