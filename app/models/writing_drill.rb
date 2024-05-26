class WritingDrill < ApplicationRecord
  validates :day_of_the_week, presence: true
  validates :start_time, presence: true
  validates :number_of_sprints, presence: true
  validates :length_of_time_in_minutes, presence: true
  validates :length_of_break_in_minutes, presence: true
end
