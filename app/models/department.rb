class Department < ApplicationRecord
  validates :name, presence: true

  belongs_to :campus

  has_many :subjects, dependent: :destroy
end
