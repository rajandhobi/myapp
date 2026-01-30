class CreateJoinStudentProduct < ActiveRecord::Migration[8.1]
  def change
    create_table :join_student_products do |t|
      t.string :students
      t.string :products 
      t.timestamps
    end
  end
end
