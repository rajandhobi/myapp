class CreatePlaces < ActiveRecord::Migration[8.1]
  def change
    create_table :places do |t|
      t.references :city, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.timestamps
    end
  end
end 

