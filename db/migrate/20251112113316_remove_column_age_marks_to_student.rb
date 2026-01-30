class RemoveColumnAgeMarksToStudent < ActiveRecord::Migration[8.1]
  def change
      remove_column :students, :marks, :integer
      remove_column :students, :age, :integer
  end
end
