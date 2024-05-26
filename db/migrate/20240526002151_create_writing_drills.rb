class CreateWritingDrills < ActiveRecord::Migration[7.1]
  def change
    create_table :writing_drills do |t|
      t.integer :day_of_the_week
      t.time :start_time
      t.integer :number_of_sprints
      t.integer :length_of_time_in_minutes
      t.integer :length_of_break_in_minutes

      t.timestamps
    end
  end
end
