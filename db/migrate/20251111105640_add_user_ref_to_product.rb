class AddUserRefToProduct < ActiveRecord::Migration[8.1]
  def change
    add_reference :products, :students, null: true, foreign_key: true
  end
end
