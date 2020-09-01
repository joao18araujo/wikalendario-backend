class Course < ApplicationRecord
  validates :name, presence: true

  belongs_to :campus
end
