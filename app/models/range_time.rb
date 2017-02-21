class RangeTime < ApplicationRecord
  belongs_to :user
  scope :user, -> (user_id) { where user_id: user_id }
  scope :without_end, -> { where("end_time is null") }
end
