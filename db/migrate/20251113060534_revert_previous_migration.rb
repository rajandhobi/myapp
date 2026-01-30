class RevertPreviousMigration < ActiveRecord::Migration[8.1]
  def change
    revert do 
      remove_column :students, :age, :integer
      remove_column :students, :marks, :integer
  end
  end
end

