class CreateReports < ActiveRecord::Migration[8.1]
  def change
    create_table :reports do |t|
      t.references :appointment, null: false, foreign_key: true
      t.string :description
      t.timestamps
    end
  end
end
