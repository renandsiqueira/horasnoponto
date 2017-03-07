class AddDayRangeToRangeTime < ActiveRecord::Migration[5.0]
  def change
    add_column :range_times, :day_range, :string
  end
end
