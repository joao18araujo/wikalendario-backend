class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.belongs_to :department, null: false, foreign_key: true
      t.belongs_to :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
