class CreateSubjectClassHasSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_class_has_schedules do |t|
      t.belongs_to :subject_class, null: false, foreign_key: true
      t.belongs_to :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
