class CreateRangeTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :range_times do |t|
      t.time :start_time
      t.time :end_time
      t.float :difference_hours
      t.float :difference_seconds
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
