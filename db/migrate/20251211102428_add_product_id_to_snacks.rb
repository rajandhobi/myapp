class AddProductIdToSnacks < ActiveRecord::Migration[8.1]
  def change
    add_reference :snacks, :product, null: false, foreign_key: true
  end
end
