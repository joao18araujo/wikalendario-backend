class Subject < ApplicationRecord
  validates :name, presence: true

  belongs_to :department
  belongs_to :semester

  has_many :subject_classes
end
