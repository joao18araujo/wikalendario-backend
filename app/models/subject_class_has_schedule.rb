class SubjectClassHasSchedule < ApplicationRecord
  belongs_to :subject_class
  belongs_to :schedule

  validates :subject_class, uniqueness: { scope: :subject_class_id }
end
