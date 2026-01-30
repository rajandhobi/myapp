class CreateSnacks < ActiveRecord::Migration[8.1]
  def change
    create_table :snacks do |t|
      t.string :title
      t.integer :price
      t.timestamps
    end
  end
end
