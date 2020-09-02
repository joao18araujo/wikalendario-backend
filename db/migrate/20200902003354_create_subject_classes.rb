class CreateSubjectClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_classes do |t|
      t.string :name
      t.belongs_to :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
