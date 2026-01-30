class AddColumnToStudent < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :student_record, :integer, default: 20, null: false
  end
end
