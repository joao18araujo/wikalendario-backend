class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.belongs_to :campus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
