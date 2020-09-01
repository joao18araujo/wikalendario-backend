class Campus < ApplicationRecord
  validates :name, presence: true
  belongs_to :university
  has_many :courses
  has_many :departments
end
