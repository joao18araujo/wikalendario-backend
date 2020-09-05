class Course < ApplicationRecord
  validates :name, presence: true

  belongs_to :campus

  has_many :users, dependent: :nullify
end
