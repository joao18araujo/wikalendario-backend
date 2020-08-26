class University < ApplicationRecord
  validates :name, presence: true

  has_many :campi
  has_many :semesters

  def current_semester
    semesters.where('semesters.start_date <= DATETIME(\'now\') and semesters.end_date >= DATETIME(\'now\')').first
  end
end
