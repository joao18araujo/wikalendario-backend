class Subject < ApplicationRecord
  validates :name, presence: true

  belongs_to :department
  belongs_to :semester
end
