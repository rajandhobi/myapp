class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :name, null: false 
      t.string :email, null: false
      t.integer :age, null: false, default: 0
      t.string :course
      t.string :city
      t.integer :marks, null: false, default: 0
      t.timestamps
    end
  end
end
