class RemoveProductInStudentId < ActiveRecord::Migration[8.1]
  def change
    remove_column :products, :students_id
  end
end
