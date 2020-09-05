class SubjectClass < ApplicationRecord
  validates :name, presence: true

  belongs_to :subject

  has_many :subject_class_has_schedules, dependent: :destroy
  has_many :schedules, through: :subject_class_has_schedules
end
