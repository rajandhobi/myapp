class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :email
      t.integer :price
      t.integer :stock
      t.string :address
      t.timestamps
    end
  end
end
