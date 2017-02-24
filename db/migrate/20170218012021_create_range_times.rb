class CreateRangeTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :range_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.float :difference_hours
      t.float :difference_seconds
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
