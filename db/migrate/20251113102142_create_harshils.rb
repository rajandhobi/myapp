class CreateHarshils < ActiveRecord::Migration[8.1]
  def change
    create_table :harshils do |t|
      t.string :name
      t.string :age
      t.integer :marks
      t.boolean :active
      t.timestamps
    end
  end
end
