class RangeTimesTodayController < ApplicationController
	before_action :auth!, only: [:index, :edit]
  	before_action :current_user, only: [:index]

    # GET /range_times_today
    # GET /range_times_today.json
	def index
    	Time.zone = current_user.time_zone
    	@range_times = RangeTime.user(current_user.id).today()
	end
end
