class RangeTime < ApplicationRecord
  belongs_to :user

  default_scope { order(start_time: :asc) }

  scope :user, -> (user_id) { where user_id: user_id }
  scope :without_end, -> { where("end_time is null") }
  scope :today, -> { where(:start_time => (DateTime.now.beginning_of_day..DateTime.now.end_of_day)) }
  scope :month, -> { where(:start_time => (DateTime.now.beginning_of_month..DateTime.now.end_of_month)) }
  scope :week, -> { where(:start_time => (DateTime.now.beginning_of_week..DateTime.now.end_of_week)) }

  def difference_time (end_time)
  	self.end_time = end_time

  	if (self.end_time != nil)
  	  self.difference_hours = TimeDifference.between(self.start_time, self.end_time).in_hours
      self.difference_seconds = TimeDifference.between(self.start_time, self.end_time).in_seconds
    end
  end
end
