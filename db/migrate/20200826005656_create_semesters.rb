class CreateSemesters < ActiveRecord::Migration[6.0]
  def change
    create_table :semesters do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.belongs_to :university, null: false, foreign_key: true

      t.timestamps
    end
  end
end
