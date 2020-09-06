class Schedule < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true

  has_many :subject_class_has_schedules, dependent: :destroy
  has_many :subject_classes, through: :subject_class_has_schedules

  def start_time=(time)
    time = '1996-1-' + time if time.try(:match?, /\d \d{2}:\d{2}/)
    super(time)
  end
end
