class Schedule < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true

  has_many :subject_class_has_schedules, dependent: :destroy
  has_many :subject_classes, through: :subject_class_has_schedules
end
