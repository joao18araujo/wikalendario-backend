class Semester < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :university

  has_many :subjects, dependent: :destroy
end
