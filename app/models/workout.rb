    class Workout < ApplicationRecord
        belongs_to :user
        validates :name, presence: true, length: { maximum: 50 }
        validates :date, presence: true
        validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 240 }
        validate :unique_name_per_day, :total_duration_per_day
      
        private
      
        def unique_name_per_day
          existing_workout = user.workouts.find_by(name: name, date: date)
          errors.add(:name, "already exists for this date") if existing_workout && existing_workout != self
        end
      
        def total_duration_per_day
          total_duration_on_date = user.workouts.where(date: date).sum(:duration)
          errors.add(:duration, "exceeds daily limit of 240 minutes") if total_duration_on_date + duration > 240
        end
      end
