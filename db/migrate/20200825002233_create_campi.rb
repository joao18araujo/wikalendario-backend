class CreateCampi < ActiveRecord::Migration[6.0]
  def change
    create_table :campi do |t|
      t.string :name
      t.belongs_to :university, null: false, foreign_key: true

      t.timestamps
    end
  end
end
