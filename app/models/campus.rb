class Campus < ApplicationRecord
  validates :name, presence: true

  belongs_to :university

  has_many :courses, dependent: :destroy
  has_many :departments, dependent: :destroy
end
